module GifReel

using FileIO

export showanimation, animate

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

animate(f; width=640, height=480, frames=20) = showanimation([f(x, y, t) for y in linspace(-1, 1, height), x in linspace(-width/height, width/height, width), t in linspace(0, 1, frames)])

end # module
