#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define NUMIN float
#else
    #define NUMIN mediump float
#endif


extern NUMIN time;
extern NUMIN vort_speed; 
extern vec4 colour_1;
extern vec4 colour_2;

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    NUMIN PIXEL_SIZE_FAC = 700.0;
    NUMIN SPIN_EASE = 0.5;
    NUMIN spin_amount = vort_speed;
    NUMIN contrast = 2.0; 

    NUMIN pixel_size = length(love_ScreenSize.xy)/PIXEL_SIZE_FAC;
    vec2 uv = (floor(screen_coords.xy*(1.0/pixel_size))*pixel_size - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    NUMIN uv_len = length(uv);

    NUMIN speed = (time*SPIN_EASE*0.3) + 302.2;
    
    NUMIN new_pixel_angle = (atan(uv.y, uv.x)) + speed - SPIN_EASE*20.*(1.*spin_amount*uv_len + (1. - 1.*spin_amount));
    vec2 mid = (love_ScreenSize.xy/length(love_ScreenSize.xy))/2.;
    uv = (vec2((uv_len * cos(new_pixel_angle) + mid.x), (uv_len * sin(new_pixel_angle) + mid.y)) - mid);

    uv *= 30.;
    speed = time*(1.5);
    
    vec2 uv2 = vec2(uv.x+uv.y);

    for(int i=0; i < 5; i++) {
        uv2 += uv + cos(length(uv));
        uv  += 0.5*vec2(cos(5.1123314 + 0.353*uv2.y + speed*0.131121),sin(uv2.x - 0.113*speed));
        uv  -= 1.0*cos(uv.x + uv.y) - 1.0*sin(uv.x*0.711 - uv.y);
    }

    NUMIN contrast_mod = (0.25*contrast + 0.5*spin_amount + 1.2);
    NUMIN paint_res = min(2., max(0.,length(uv)*(0.035)*contrast_mod));
    
    NUMIN mix_val = (sin(paint_res * 3.14159) + 1.0) * 0.5;
    
    vec4 ret_col = mix(colour_2, colour_1, mix_val);
    

    vec4 berry_col = vec4(0.929, 0.604, 0.549, 1.0); 
    
   
    NUMIN streak_wave = (sin(paint_res * 8.0 - time * 0.6) + 1.0) * 0.5;
    
    NUMIN streak_mask = pow(streak_wave, 12.0);
    
    ret_col = mix(ret_col, berry_col, streak_mask * 0.85);

    ret_col += pow(mix_val, 3.0) * 0.15;
    
    ret_col.a = 1.0;

    return ret_col;
}