within Elevator.Components.Testings;

model Car_Testing01
  extends Modelica.Icons.Example;
  Car car(n = 3, m = {20, 16.7, 10}, c = {2e4, 2e4, 1.7e4}, d = {250, 250, 250}, s = {0, 0, 0}, m_car = 1000)  annotation(
    Placement(transformation(origin = {46, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Sources.Speed speed annotation(
    Placement(transformation(origin = {12, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 1, offset = 0, startTime = 10) annotation(
    Placement(transformation(origin = {-52, 18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, height = -1, offset = 0, startTime = 90) annotation(
    Placement(transformation(origin = {-52, -18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Sum sum1(nin = 2)  annotation(
    Placement(transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(speed.flange, car.flange_a) annotation(
    Line(points = {{22, 0}, {32, 0}, {32, 14}, {46, 14}, {46, 10}}, color = {0, 127, 0}));
  connect(speed.v_ref, sum1.y) annotation(
    Line(points = {{0, 0}, {-8, 0}}, color = {0, 0, 127}));
  connect(ramp1.y, sum1.u[1]) annotation(
    Line(points = {{-41, 18}, {-33, 18}, {-33, 0}}, color = {0, 0, 127}));
  connect(ramp2.y, sum1.u[2]) annotation(
    Line(points = {{-41, -18}, {-33, -18}, {-33, 0}}, color = {0, 0, 127}));
end Car_Testing01;