module GifReel

using FileIO, Base64

export showanimation, animate

showanimation(imgv::Vector) = showanimation(cat(imgv..., dims=3))
function showanimation(imgs)
	buf = IOBuffer()
	write(buf, "<img src=\"data:image/gif;base64,")
	b64 = Base64EncodePipe(buf)
	save(Stream(format"GIF", b64), imgs)
	close(b64)
	write(buf, "\"></img>")
	HTML(String(take!(buf)))
end

showanimation(f::Function, frames) = showanimation([f(i) for i in 1:frames])

animate(f; width=640, height=480, frames=20) = showanimation([f(x, y, t) for y in range(-1, stop=1, length=height), x in range(-width/height, stop=width/height, length=width), t in range(0, stop=1, length=frames)])

end # module
