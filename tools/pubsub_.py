import asyncio
import websockets
import json
from collections import defaultdict

PORT = 6789
subscribers = defaultdict(set)  # topic -> set of WebSocket clients
message_counter = 0  # total number of published messages

async def handler(websocket):
    global message_counter, transmit_allowed

    try:
        async for message in websocket:
            msg = json.loads(message)
            action = msg.get("action")
            topic = msg.get("topic")
            data = msg.get("data")

            # Subscriptions
            if action == "subscribe" and topic:
                print(f"🔔 {websocket.remote_address} subscribed to {topic}")
                subscribers[topic].add(websocket)

            # Publishing
            elif action == "publish" and topic and data is not None:
                # Handle control messages
                if topic == "control":
                    continue  # do not forward control messages

                message_counter += 1
                # Attach message counter
                data['index'] = message_counter
            
                payload = json.dumps({
                    "topic": topic,
                    "data": data
                })

                dead = set()
                for ws in subscribers[topic]:
                    try:
                        await ws.send(payload)
                    except:
                        dead.add(ws)

                # Remove disconnected clients
                subscribers[topic] -= dead

    except websockets.exceptions.ConnectionClosed:
        print("🔌 WebSocket client disconnected")
        # Remove disconnected client from all topics
        for subs in subscribers.values():
            subs.discard(websocket)

async def main():
    print(f"🚀 Pub/Sub server running on ws://0.0.0.0:{PORT}")
    async with websockets.serve(handler, "0.0.0.0", PORT):
        await asyncio.Future()  # Run forever

asyncio.run(main())
