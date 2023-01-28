-- SOUNDS LINK :
-- Shot: https://freesound.org/people/CJDeets/sounds/476740/
-- ira : https://freesound.org/people/Twisted_Euphoria/sounds/205938/


local tsuyu_asuinods = {
"default:dirt",
"default:dirt_with_rainforest",
"default:dirt_with_grass",
"default:dirt_with_dry_grass",
"default:dry_dirt_with_dry_grass",
"default:dirt_with_coniferous_litter",
"default:stone",
"default:ice",
"default:snowblock",
"default:dirt_with_snow",
"default:sand",
"default:desert_sand",
"default:desert_stone",
"default:stone",
"default:desert_stone",
--"default:cobble",
"default:mossycobble",
"default:chest",
"default:ice",

}



mobs:register_mob("tsuyu_asui:tsuyu_asui", {
	-- nametag = "tsuyu_asuiss" ,
	type = "monster",
	passive = false,
	attack_type = "shoot",
        arrow = "tsuyu_asui:tsuyu_asui_arrow",
	shoot_interval = 2.0,
	shoot_offset = 1.5,
	pathfinding = true,
	reach = 5,
	damage = math.random(3,5),
	hp_min = 20,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.4, -1.0, -0.4, 0.4, 0.9, 0.4},
	visual = "mesh",
	mesh = "tsuyu.b3d",
	rotate = 180,
	textures = {
		{"froppy.png"},
	},
	--glow = 4,
	--blood_texture = "",
	makes_footstep_sound = true,
	sounds = {
		shoot_attack = "tsuyu2",

		--death = "",
	},
	walk_velocity = 2,
	run_velocity = 5,
	jump_height = 2,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,
	drops = {
{name = "rangedweapons:glock17", chance = 2, min = 1, max = 50,}, -- if "rangedweapons" mod is installed	

	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 0,
		walk_start = 20,
		walk_end = 60,
		run_start = 80,
		run_end = 100,
		shoot_start = 120,
		shoot_end = 140,
	},
})



mobs:register_arrow("tsuyu_asui:tsuyu_asui_arrow", {
	visual = "sprite",
	visual_size = {x = 0.2, y = 0.2},
	textures = {"glock_shot.png"},
	velocity = 44,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_node = function(self, pos, node)
	minetest.sound_play("tsuyu1", {pos=self.object:get_pos(), gain=1.0, max_hear_distance = 10})
	for i=1,10 do

	  minetest.add_particle({
		pos = pos,
		acceleration = 0,
          	velocity = {x =math.random(-3,3),y=math.random(-3,3),z=math.random(-3,3)},
		size = 1,
		expirationtime = 2.0,
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 1,
	        })

	        end
	end
})


mobs:spawn({
	name = "tsuyu_asui:tsuyu_asui",
	nodes = tsuyu_asuinods,
	min_light = 0,
	max_light = 14,
	chance = 7000,
	--min_height = 0,
	--max_height = 200,
	max_height = 200,
	active_object_count = 5,
})


mobs:register_egg("tsuyu_asui:tsuyu_asui", "Froppy", "froppy_inv.png", 0)
