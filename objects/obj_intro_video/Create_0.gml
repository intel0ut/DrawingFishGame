/// @description Insert description here
// 

if os_type == os_android {
	video = video_open("Game_Intro_Rendered_mobile.mp4")
}
else if os_type == os_windows {
	video = video_open("Game_Intro_Rendered.mp4")
}

var _format = video_get_format();
if (_format == video_format_yuv)
{
    videochromasampler = shader_get_sampler_index(shader_YUV, "v_chroma");
}

video_enable_loop(false)