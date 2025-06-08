within Elevator.Components.Testings;

model Human_Testing01
  extends Modelica.Icons.Example;
  Human human annotation(
    Placement(transformation(origin = {0, 16}, extent = {{-16, -16}, {16, 16}})));
  Modelica.Mechanics.Translational.Sources.Position position(exact = true)  annotation(
    Placement(transformation(origin = {-24, -26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 2, duration = 10, offset = 0, startTime = 10)  annotation(
    Placement(transformation(origin = {-64, -26}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(position.flange, human.flange_a) annotation(
    Line(points = {{-14, -26}, {0, -26}, {0, 0}}, color = {0, 127, 0}));
  connect(ramp.y, position.s_ref) annotation(
    Line(points = {{-52, -26}, {-36, -26}}, color = {0, 0, 127}));
end Human_Testing01;