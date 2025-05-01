# 2025-04-04T20:28:12.822382900
import vitis

client = vitis.create_client()
client.set_workspace(path="hls")

comp = client.create_hls_component(name = "hls_component",cfg_file = ["C:\Users\Administrator\Desktop\EEE\hls\cnn_conv\hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="hls_component")
comp.run(operation="C_SIMULATION")

vitis.dispose()

