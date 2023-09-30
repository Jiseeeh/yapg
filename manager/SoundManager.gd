extends Node

var background_music = preload("res://art/Sound/Retro Reggae.ogg")
var gameover_music = preload("res://art/Sound/gameover3.ogg")
var collect_music = preload("res://art/Sound/pickup2.ogg")
var hit_music = preload("res://art/Sound/hit1.ogg")


func inject_stream_players():
	_inject_bg_music()
	_inject_gameover_music()
	_inject_collect_music()
	_inject_hit_music()


func _inject_bg_music():
	# check if there is already a background music player
	if $BackgroundMusicPlayer:
		return

	var bg_music = AudioStreamPlayer.new()
	bg_music.name = "BackgroundMusicPlayer"
	bg_music.stream = background_music
	bg_music.stream.loop = true

	add_child(bg_music)


func _inject_gameover_music():
	# check if there is already a gameover music player
	if $GameoverMusicPlayer:
		return

	var gameover = AudioStreamPlayer.new()
	gameover.name = "GameoverMusicPlayer"
	gameover.stream = gameover_music

	add_child(gameover)


func _inject_collect_music():
	# check if there is already a collect music player
	if $CollectMusicPlayer:
		return

	var collect = AudioStreamPlayer.new()
	collect.name = "CollectMusicPlayer"
	collect.stream = collect_music

	add_child(collect)


func _inject_hit_music():
	# check if there is already a hit music player
	if $HitMusicPlayer:
		return

	var hit = AudioStreamPlayer.new()
	hit.name = "HitMusicPlayer"
	hit.stream = hit_music

	add_child(hit)


func play_bg_music():
	var bg_music: AudioStreamPlayer = $BackgroundMusicPlayer

	if not bg_music.is_playing():
		bg_music.play()


func stop_bg_music():
	var bg_music: AudioStreamPlayer = $BackgroundMusicPlayer

	if bg_music.is_playing():
		bg_music.stop()


func play_gameover_music():
	var gameover: AudioStreamPlayer = $GameoverMusicPlayer

	if not gameover.is_playing():
		gameover.play()


func stop_gameover_music():
	var gameover: AudioStreamPlayer = $GameoverMusicPlayer

	if gameover.is_playing():
		gameover.stop()


func play_collect_music():
	var collect: AudioStreamPlayer = $CollectMusicPlayer

	if not collect.is_playing():
		collect.play()


func stop_collect_music():
	var collect: AudioStreamPlayer = $CollectMusicPlayer

	if collect.is_playing():
		collect.stop()


func play_hit_music():
	var hit: AudioStreamPlayer = $HitMusicPlayer

	if not hit.is_playing():
		hit.play()


func stop_hit_music():
	var hit: AudioStreamPlayer = $HitMusicPlayer

	if hit.is_playing():
		hit.stop()
