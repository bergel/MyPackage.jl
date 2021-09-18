using Test, MyPackage

@test 42 == (40 + 2)


aShape = Box()
@test aShape.position == (0.0, 0.0)
@test getPosition(aShape) == (0.0, 0.0)
@test getPosition(aShape) == (0, 0)

setPosition!(aShape, (2.0, 3.0))
@test getPosition(aShape) == (2.0, 3.0)
@test getPosition(aShape) == (2, 3)


aCircle = Circle()
@test getSize(aCircle) == 5
setSize!(aCircle, 15.0)
@test getSize(aCircle) == 15
setSize!(aCircle, 24)
@test getSize(aCircle) == 24

composite = Composite()
@test numberOfShapes(composite) == 0
addShape!(composite, aCircle)
@test numberOfShapes(composite) == 1
addShape!(composite, aShape)
@test numberOfShapes(composite) == 2