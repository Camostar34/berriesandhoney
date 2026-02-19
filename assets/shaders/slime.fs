#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define MY_HIGHP_OR_MEDIUMP highp
#else
    #define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP float transition; 


const vec3 honey_deep = vec3(0.6, 0.35, 0.05);  
const vec3 honey_mid  = vec3(0.95, 0.7, 0.1);   
const vec3 honey_bright = vec3(1.0, 0.85, 0.3); 
const vec3 highlight_color = vec3(0.8, 0.75, 0.6); 

const float min_opacity = 0.35; 
const float max_opacity = 0.95; 
const float distortion_strength = 0.02; 

const float boil_speed = 1.8;
const float drip_speed = 0.8;
const float uv_scale = 9.0;

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
   
    vec2 base_uv = texture_coords * uv_scale;
    base_uv.y -= time * drip_speed;

    vec2 uv_loop = base_uv;
    float t = time * boil_speed;
    vec2 uv2 = vec2(uv_loop.x + uv_loop.y);

    
    for (int i = 0; i < 5; i++) {
        uv2 += sin(max(uv_loop.x, uv_loop.y)) + uv_loop;
        uv_loop += 0.5 * vec2(
            cos(5.112 + 0.353 * uv2.y + t * 0.13),
            sin(uv2.x - 0.113 * t)
        );
        uv_loop -= cos(uv_loop.x + uv_loop.y) - sin(uv_loop.x * 0.711 - uv_loop.y);
    }

   
    float noise = (sin(length(uv_loop) * 0.3) + 1.0) * 0.5;

    
    vec3 honey_color = mix(honey_deep, honey_mid, smoothstep(0.2, 0.6, noise));
    honey_color = mix(honey_color, honey_bright, smoothstep(0.6, 0.9, noise));


    vec2 distorted_coords = texture_coords + (vec2(cos(noise * 6.28), sin(noise * 6.28)) * distortion_strength * transition);
    distorted_coords = clamp(distorted_coords, 0.0, 1.0);
    vec4 scene_color = Texel(texture, distorted_coords);


    float dynamic_opacity = mix(min_opacity, max_opacity, noise);
    
  
    dynamic_opacity *= transition;

    vec3 final_rgb = mix(scene_color.rgb, honey_color, dynamic_opacity);

  
    float highlight_mask = smoothstep(0.85, 0.99, noise);
    
    
    final_rgb += highlight_color * highlight_mask * 0.5 * transition;

    return vec4(final_rgb, scene_color.a) * colour;
}