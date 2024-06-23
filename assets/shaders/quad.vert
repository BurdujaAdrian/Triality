#version 430 core

// input

//output
layout (location  = 0) out vec2 textureCoordsOut;



void main(){

  //Transform transform = transforms[gl_InstanceID];
  // Generating Vertices on the GPU
  // mostly because we have a 2D Engine

  // OpenGL Coordinates
  // -1/ 1                1/ 1
  // -1/-1                1/-1

  vec2 vertices[6] =
  {

    vec2(-0.5 , 0.5 ),
    vec2(-0.5 ,-0.5 ),
    vec2( 0.5 , 0.5 ),
    vec2( 0.5 , 0.5 ),
    vec2(-0.5 ,-0.5 ),
    vec2( 0.5 ,-0.5 ),
    // transform.pos,                                        // Top Left
    // vec2(transform.pos + vec2(0.0, transform.size.y)),    // Bottom Left
    // vec2(transform.pos + vec2(transform.size.x, 0.0)),    // Top Right
    // vec2(transform.pos + vec2(transform.size.x, 0.0)),    // Top Right
    // vec2(transform.pos + vec2(0.0, transform.size.y)),    // Bottom Left
    // transform.pos + transform.size                        // Bottom Right
  };

  float left = 0.0;
  float top = 0.0;
  float right = 125.0;
  float bottom = 100.0;

  vec2 textureCoords[6] = {
    vec2(left, top),
    vec2(left, bottom),
    vec2(right,top),
    vec2(right,top),
    vec2(left,bottom),
    vec2(right,bottom)
  };

  gl_Position = vec4(vertices[gl_VertexID], 1.0, 1.0);

  textureCoordsOut = textureCoords[gl_VertexID];  
}