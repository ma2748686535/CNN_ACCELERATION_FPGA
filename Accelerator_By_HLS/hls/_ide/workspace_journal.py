# 2025-04-18T03:52:11.639645700
import vitis

client = vitis.create_client()
client.set_workspace(path="hls")

comp = client.get_component(name="cnn_conv")
comp.run(operation="SYNTHESIS")

