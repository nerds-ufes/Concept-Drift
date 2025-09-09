from netaddr import IPAddress
p4main = bfrt.p4_main

def configure_recirculation_ports():
    # Obter a referência para a tabela de portas
    port_table = bfrt.port.port_hdl_info

    # IDs das portas de recirculação (devem corresponder aos definidos no P4)
    recirculation_port_ids = [ 196 ]

    for port_id in recirculation_port_ids:
        try:
            # Adicionar a porta e configurá-la como porta de recirculação
            # A configuração exata pode variar dependendo da versão do SDE e do uso específico
            # Geralmente, envolve habilitar a porta e, possivelmente, definir um tipo de porta
            port_table.entry_add(
                port_hdl_id=port_id,
                port_type="RECIRC_PORT", # Pode ser diferente dependendo do SDE
                # Outras propriedades como speed, autoneg, etc., podem ser definidas aqui
            )
            print(f"Porta de recirculação {port_id} configurada com sucesso.")
        except Exception as e:
            print(f"Erro ao configurar a porta de recirculação {port_id}: {e}")

configure_recirculation_ports()