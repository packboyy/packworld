extends Node3D
# Called when the node enters the scene tree for the first time.
signal blocktextureidsignal(blockid)

func _ready():
	genchunk(64)
	pass

func genchunk(chunkrange):
	var noise = FastNoiseLite.new()
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.cellular_jitter = 0
#	for every x y and z in the chunkrange
	for x in range(chunkrange):
		for y in range(chunkrange):
			for z in range(3):
				var o_noise = noise.get_noise_3d(x, y, z)*100
				if y >= 6:
					if o_noise > 0.09:
						BlockReg.inst(Vector3(x,y,z), "dirt")
				if y < 6:
					if o_noise > 0.09:
						BlockReg.inst(Vector3(x,y,z), "stone")
