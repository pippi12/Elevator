within Elevator.Components;

model Car "任意の人数の人を載せれるかご"
  parameter Integer n"人数";
  parameter Modelica.Units.SI.Mass m[n];
  parameter Modelica.Units.SI.TranslationalSpringConstant c[n];
  parameter Modelica.Units.SI.TranslationalDampingConstant d[n];
  parameter Modelica.Units.SI.Length s[n];
  parameter Modelica.Units.SI.Mass m_car=1000"かごの質量";
  Modelica.Mechanics.Translational.Components.Mass car(m = m_car)  annotation(
    Placement(transformation(origin = {0, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(
    Placement(transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}})));
  Human human[n](m = m, c = c, d = d, s = s)  annotation(
    Placement(transformation(origin = {0, -40}, extent = {{-18, -18}, {18, 18}})));
  Modelica.Blocks.Sources.Constant const(k = -9.8*m_car) annotation(
    Placement(transformation(origin = {-42, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Sources.Force force annotation(
    Placement(transformation(origin = {-42, -42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(flange_a, car.flange_a) annotation(
    Line(points = {{0, 98}, {80, 98}, {80, -82}, {0, -82}}, color = {0, 127, 0}));
  for i in 1:n loop
    connect(car.flange_b, human[i].flange_a);
  end for;
  connect(const.y, force.f) annotation(
    Line(points = {{-42, -16}, {-42, -30}}, color = {0, 0, 127}));
  connect(force.flange, car.flange_b) annotation(
    Line(points = {{-42, -52}, {-42, -62}, {0, -62}}, color = {0, 127, 0}));

annotation(
    Icon(graphics = {Rectangle(fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}})}));
end Car;