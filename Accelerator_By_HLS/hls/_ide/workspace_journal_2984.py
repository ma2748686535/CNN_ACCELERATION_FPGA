# 2025-04-11T20:53:33.049087400
import vitis

client = vitis.create_client()
client.set_workspace(path="hls")

comp = client.get_component(name="cnn_conv")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

