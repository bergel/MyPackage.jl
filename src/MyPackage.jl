module MyPackage

export Shape, getPosition, setPosition!
export Box
export Circle, getSize, setSize!
export Composite, numberOfShapes, addShape!

greet() = print("Hello World!")

abstract type Shape end
function getPosition(s::Shape)
    return s.position
end

function setPosition!(s::Shape, newPosition::Tuple{Float64, Float64})
    return s.position = newPosition
end

mutable struct Box <: Shape
    position::Tuple{Float64, Float64}
    eventCallbacks::Vector
    height::Float64
    width::Float64
end
Box() = Box((0.0, 0.0), [], 5, 5)

mutable struct Circle <: Shape
    position::Tuple{Float64, Float64}
    eventCallbacks::Vector
    size::Float64
end
Circle() = Circle((0.0, 0.0), [], 5)
getSize(c::Circle) = c.size
setSize!(c::Circle, aSize::Int64) = setSize!(c::Circle, Float64(aSize))
function setSize!(c::Circle, aSize::Float64)
    c.size = aSize
end

mutable struct Composite <: Shape
    position::Tuple{Float64, Float64}
    eventCallbacks::Vector
    shapes::Vector{Shape}
end
Composite() = Composite((0.0, 0.0), [], [])
function addShape!(c::Composite, childShape::Shape)
    push!(c.shapes, childShape)
end
numberOfShapes(c::Composite) = length(c.shapes)
end # module
