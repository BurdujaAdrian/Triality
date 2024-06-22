#version 430 core

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

  gl_Position = vec4(vertices[gl_VertexID], 1.0, 1.0);
  
}