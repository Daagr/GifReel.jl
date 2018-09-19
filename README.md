# GifReel

GifReel.jl is a simple Reel.jl clone.

Features / Differences:
- Doesn't create files when used
- Embeds gif in the document using data URI scheme
- Doesn't call external programs

Interface is also different
- `animate((x∈[-1..1], y∈[-1..1], t∈[0..1])->???; width, height, frames)`
- `showanimation((i∈(1:frames))->???, frames)`
- `showanimation([img1, img2, ...])`
- `showanimation(3d_array)`