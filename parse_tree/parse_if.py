import re
import sys
import pydot

class Node:
    def __init__(self, id, feature=None, threshold=None, value=None):
        self.id = id
        self.level = 0
        self.feature = feature      # e.g. "petal length (cm)"
        self.threshold = threshold  # numeric split threshold
        self.value = value          # class label at leaf
        self.left = None
        self.right = None

    def __repr__(self):
        if self.value is not None:
            return f"Leaf(id={self.id}, value={self.value})"
        return f"Node(id={self.id}, feature={self.feature}, threshold={self.threshold})"

features = dict()

def parse_dot(file_path):
    (graph,) = pydot.graph_from_dot_file(file_path)

    # Parse node attributes
    nodes = {}
    for n in graph.get_nodes():
        node_id = n.get_name()
        if not node_id.isdigit():
            continue
        label = n.get_label()
        if label:
            label = label.strip('<>').replace("<br/>", "\n")
            # Extract feature/threshold if present
            match = re.search(r"([a-zA-Z0-9\._]+) &le; ([0-9\.\-e]+)", label)
            if match:
                feature, thr = match.groups()
                nodes[node_id] = Node(node_id, feature, float(thr))
                features[feature] = 0

            else:
                # Leaf: extract value
                val_match = re.search(r"value = ([0-9\.\-e]+)", label)
                value = float(val_match.group(1)) if val_match else None
                nodes[node_id] = Node(node_id, value=value)

    # Parse edges to build tree
    edges = [(e.get_source(), e.get_destination()) for e in graph.get_edges()]
    children = {src: [] for src, _ in edges}
    for src, dst in edges:
        children[src].append(dst)

    # Assign left/right
    for src, dsts in children.items():
        if len(dsts) >= 1:
            nodes[src].left = nodes[dsts[0]]
        if len(dsts) >= 2:
            nodes[src].right = nodes[dsts[1]]

    return nodes["0"]  # root

# --- Example usage ---

def order(r, level, space):
    if r == None: return
    #print(f"{space} {r}" )
    r.level = level
    order(r.left, level + 1, f"{space}    ")
    order(r.right, level + 1, f"{space}    ")

def generate_MA(r):
    if r == None: return 0, 0, ""

    is_leaf_l, clss_l, action_l = generate_MA(r.left)
    is_leaf_r, clss_r, action_r = generate_MA(r.right)


    if r.value is not None:
        return True, r.value, "do_leaf_node"

    
    str_l = ""
    str_r = ""
    for k, v in features.items():
        str_l += f"{k}_start = 0,"
        if r.feature == k:
            str_l += f"{k}_end = {int(r.threshold)},"
            str_r += f"{k}_start = {int(r.threshold)+1},"
        else:
            str_l += f"{k}_end = {v},"
            str_r += f"{k}_start = 0,"
        str_r += f"{k}_end = {v},"


    if is_leaf_l:
        print(f"basic_classification.add_with_{action_l}(node_id={r.id}, {str_l} port_t = 130) ")
    else:
        print(f"basic_classification.add_with_do_internal_node(node_id={r.id}, {str_l} pass_cnt_t={r.id}, next_node_id_t={clss_l}) ")

    if is_leaf_r:
        print(f"basic_classification.add_with_{action_r}(node_id={r.id}, {str_r} port_t = 130) ")
    else:
        print(f"basic_classification.add_with_do_internal_node(node_id={r.id}, {str_r} pass_cnt_t={r.id}, next_node_id_t={clss_r}) ")


    
    return False, r.id, ""
    #basic_classification.add_with_do_internal_node(
    #    pass_cnt=0, node_id=0, ctrl_start=0, ctrl_end=10, protocol_start=0, protocol_end=10, total_len_start=0, total_len_end
    

if __name__ == "__main__":
    file = sys.argv[1]    
    


    root = parse_dot(file)
    order(root, 0, " ")

    for f in features.keys():
        features[f] = 100000

    features = dict(sorted(features.items()))

    print(features)
    generate_MA(root)

