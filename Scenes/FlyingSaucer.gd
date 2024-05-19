extends Node2D

# Properties
var health = 3
var speed = 100
var direction = Vector2()
var sprite: Sprite2D
var collision_shape: CollisionShape2D
# var damage_sound = preload("res://sounds/damage.wav")  # ADd sound if wanted

func _ready():
<<<<<<< Updated upstream
	sprite = get_node("Sprite2D")
	collision_shape = get_node("CollisionShape2D")
=======
	add_to_group("Saucers")
	collision_shape = self.get_node("CollisionShape2D")
>>>>>>> Stashed changes
	randomize()
	direction = Vector2(randf() * 2.0 - 1.0, randf() * 2.0 - 1.0).normalized()

	# Assuming collision detection is setup, connect signal here
#     connect("body_entered", self, "_on_FlyingSaucer_body_entered")

func _process(delta):
	position += direction * speed * delta
	if randf() * 100 > 98:
		direction = Vector2(randf() * 2.0 - 1.0, randf() * 2.0 - 1.0).normalized()
	check_bounds()
	update_animation()

# Function to spawn trash
func spawn_trash():
<<<<<<< Updated upstream
	# var trash = Trash.instance()  # Replace 'Trash' with actual file
#    trash.position = position
#    get_parent().add_child(trash)
=======
	var new_trash = trash.instantiate()
	new_trash.position = position
	new_trash.add_to_group("Trash")
	get_parent().add_child(new_trash)
>>>>>>> Stashed changes

 # Function to take damage func take_damage(amount):
func take_damage(amount):
	health -= amount
	if health <= 0:
		die()
		play_sound()
		update_animation()



# Function to handle the saucer's destruction
func die():
	queue_free()  # Removes the node from the scene

# Play sound effects
func play_sound():
	var player = AudioStreamPlayer.new()
	# player.stream = damage_sound
	add_child(player)
	player.play()
	# player.connect("finished", player, "queue_free")

# Check if the saucer is within screen bounds
func check_bounds():
	var screen_size = get_viewport_rect().size
	if position.x < 0 or position.x > screen_size.x:
		direction.x *= -1
	if position.y < 0 or position.y > screen_size.y:
		direction.y *= -1

# Update sprite animation based on the saucer's state
func update_animation():

	if health < 50:
		sprite.play("damaged")
	else:
		sprite.play("normal")

# Collision handling function
<<<<<<< Updated upstream
func _on_FlyingSaucer_body_entered(body):
	if body.is_in_group("enemies"):
		take_damage(10)
=======
func hit():
	health -= 1
	if health <= 0:
		queue_free()
>>>>>>> Stashed changes
