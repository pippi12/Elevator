within Elevator.Components;

model Car01 "成人男性・成人女性・子供が乗っているかご"
  parameter Modelica.Units.SI.Mass m=1000"かごの質量";
  Modelica.Mechanics.Translational.Components.Mass car annotation(
    Placement(transformation(origin = {0, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Human man annotation(
    Placement(transformation(origin = {-40, -22}, extent = {{-18, -18}, {18, 18}})));
  Human woman(m = 16.7, c = 20000, d = 250, s = 1.55)  annotation(
    Placement(transformation(origin = {0, -22}, extent = {{-18, -18}, {18, 18}})));
  Human child(m = 10, c = 17000, d = 250, s = 1.30)  annotation(
    Placement(transformation(origin = {40, -22}, extent = {{-18, -18}, {18, 18}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(
    Placement(transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(woman.flange_a, car.flange_b) annotation(
    Line(points = {{0, -40}, {0, -62}}, color = {0, 127, 0}));
  connect(car.flange_b, child.flange_a) annotation(
    Line(points = {{0, -62}, {40, -62}, {40, -40}}, color = {0, 127, 0}));
  connect(car.flange_b, man.flange_a) annotation(
    Line(points = {{0, -62}, {-40, -62}, {-40, -40}}, color = {0, 127, 0}));
  connect(flange_a, car.flange_a) annotation(
    Line(points = {{0, 98}, {80, 98}, {80, -82}, {0, -82}}, color = {0, 127, 0}));

annotation(
    Icon(graphics = {Rectangle(fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}})}));
end Car01;