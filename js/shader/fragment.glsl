varying float vNoise;
varying float distNoise;
//uniform sampler2D girlTexture;
uniform sampler2D uImage;
varying vec2 vUv;
uniform float time;
uniform float hoverState;
void main()	{
	// //vec2 newUV = (vUv - vec2(0.5))*resolution.zw + vec2(0.5);
	// //gl_FragColor = vec4(vUv,0.0,1.);
	// vec3 color1 = vec3(1., 0., 0.);
	// vec3 color2 = vec3(0., 0., 1.);
	// vec3 finalColor = mix(color1, color2, 0.5*(vNoise +1.));

	// vec2 newUV = vUv;

	// //newUV = vec2(newUV.x + 0.05*sin(newUV.y*10.0 + time), newUV.y); 

	// //vec4 girlView = texture2D(girlTexture, newUV);

	// gl_FragColor = vec4(finalColor,1.);
	// gl_FragColor = vec4(vUv, 0., 1.);
	// //gl_FragColor = vec4(girlView);
	// //gl_FragColor = girlView + vec4(vNoise);
	// //gl_FragColor = vec4(vNoise);

	// vec4 textureImage = texture2D(uImage, newUV);

	// gl_FragColor = textureImage;
	// gl_FragColor.rgb += 0.05*vec3(distNoise);

	//Implementing another effect from tympanus
	vec2 newUV = vUv;
	vec2 p = newUV;
	float x = hoverState;
	x = smoothstep(.0,1.0,(x*2.0+p.y-1.0));
	vec4 f = mix(
		texture2D(uImage, (p-.5)*(1.-x)+.5), 
		texture2D(uImage, (p-.5)*x+.5), 
		x);
	gl_FragColor = f;
	gl_FragColor.rgb += 0.05*vec3(distNoise);
}