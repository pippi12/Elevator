within Elevator.Components;

model Human
  parameter Modelica.Units.SI.Mass m=20 "体重";
  parameter Modelica.Units.SI.TranslationalSpringConstant c=20000 "等価剛性";
  parameter Modelica.Units.SI.TranslationalDampingConstant d=250 "減衰定数";
  parameter Modelica.Units.SI.Length s=1.70 "身長";

  Modelica.Mechanics.Translational.Components.Mass mass(m = m, s(start = s, fixed = true), L = 0, v(start = 0, fixed = true))  annotation(
    Placement(transformation(origin = {0, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = -9.8*m) annotation(
    Placement(transformation(origin = {0, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Sources.Force force annotation(
    Placement(transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(s_rel(start = 0, fixed = false), v_rel(start = 0, fixed = false), c = c, d = d, s_rel0 = s)  annotation(
    Placement(transformation(origin = {0, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(force.flange, mass.flange_b) annotation(
    Line(points = {{0, 10}, {0, 2}}, color = {0, 127, 0}));
  connect(const.y, force.f) annotation(
    Line(points = {{0, 45}, {0, 32}}, color = {0, 0, 127}));
  connect(springDamper.flange_b, mass.flange_a) annotation(
    Line(points = {{0, -28}, {0, -18}}, color = {0, 127, 0}));
  connect(springDamper.flange_a, flange_a) annotation(
    Line(points = {{0, -48}, {0, -100}}, color = {0, 127, 0}));
annotation(
    Icon(graphics = {Ellipse(origin = {0, 59}, fillColor = {88, 88, 88}, fillPattern = FillPattern.Solid, extent = {{-20, 21}, {20, -21}}), Polygon(origin = {0, -25}, fillColor = {83, 83, 83}, fillPattern = FillPattern.Solid, points = {{0, 63}, {-80, 25}, {-76, 17}, {-20, 43}, {-20, -63}, {-10, -63}, {0, 5}, {10, -63}, {20, -63}, {20, 43}, {76, 15}, {80, 25}, {0, 63}}), Text(origin = {0, 110}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}));
end Human;