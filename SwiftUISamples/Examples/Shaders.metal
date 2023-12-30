//
//  Shaders.metal
//  SwiftUISamples
//
//  Created by Mark Wells on 12/24/23.
//

#include <metal_stdlib>
using namespace metal;

float normalizedAngle(float angle);

// ColorEffect shaders

[[ stitchable ]] half4 passthrough( float2 position, half4 color) {
    return color;
}

[[ stitchable ]] half4 colorChange( float2 position, half4 color) {
    return half4(1, 0, 0, color.a);
}

[[ stitchable ]] half4 colorInvert( float2 position, half4 color) {
    return half4(color.r, color.g, color.b, 1 - color.a);
}

[[ stitchable ]] half4 gradient( float2 position, half4 color) {
    return half4(position.x / position.y, 0, position.y / position.x, color.a);
}

[[ stitchable ]] half4 rainbow( float2 position, half4 color, float t) {
    float angle = atan2(position.x, position.y) + t;
    return half4(
                 normalizedAngle(angle),
                 normalizedAngle(angle + 20),
                 normalizedAngle(angle + 40),
                 color.a);
}

// DistortionEffect shaders

[[ stitchable ]] float2 wave( float2 position, float t) {
    position.y += sin(position.y / 20.0 + t * 5) * 5;
    return position;
}

// private

float normalizedAngle(float angle) {
    return sin(angle) / 0.5 + 0.5;
}


