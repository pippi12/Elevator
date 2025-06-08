within Elevator.Components.Testings;

model RopeSplDmp_Testing00
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Mass car_mass = 1000;
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {80, -22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m = car_mass, s(start = 10, fixed = true), L = 1.7, v(start = 0, fixed = true))  annotation(
    Placement(transformation(origin = {80, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Force force annotation(
    Placement(transformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = -car_mass*9.8)  annotation(
    Placement(transformation(origin = {46, 72}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp car_height(height = 30, duration = 60, offset = 10, startTime = 10)  annotation(
    Placement(transformation(origin = {-88, 28}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression EA(y = 51.45*10e9*52.1*10e-6)  annotation(
    Placement(transformation(origin = {-44, 16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Division division annotation(
    Placement(transformation(origin = {-8, 22}, extent = {{-10, 10}, {10, -10}})));
  Modelica.Blocks.Sources.RealExpression m(y = car_mass) annotation(
    Placement(transformation(origin = {-80, -42}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Sqrt sqrt1 annotation(
    Placement(transformation(origin = {-12, -36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Product product annotation(
    Placement(transformation(origin = {-40, -36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression coeff1(y = 2) annotation(
    Placement(transformation(origin = {-80, -58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression zeta(y = 0.01) annotation(
    Placement(transformation(origin = {-80, -78}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(transformation(origin = {48, -58}, extent = {{-10, -10}, {10, 10}})));
  RopeSplDmp ropeSplDmp annotation(
    Placement(transformation(origin = {80, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(transformation(origin = {20, -52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add add(k2 = -1)  annotation(
    Placement(transformation(origin = {-46, 44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression shaft_height(y = 50)  annotation(
    Placement(transformation(origin = {-88, 50}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(force.flange, mass.flange_b) annotation(
    Line(points = {{80, 50}, {80, 44}}, color = {0, 127, 0}));
  connect(force.f, const.y) annotation(
    Line(points = {{80, 72}, {57, 72}}, color = {0, 0, 127}));
  connect(EA.y, division.u1) annotation(
    Line(points = {{-33, 16}, {-20, 16}}, color = {0, 0, 127}));
  connect(division.y, product.u1) annotation(
    Line(points = {{3, 22}, {9, 22}, {9, 2}, {-73, 2}, {-73, -30}, {-53, -30}}, color = {0, 0, 127}));
  connect(m.y, product.u2) annotation(
    Line(points = {{-69, -42}, {-53, -42}}, color = {0, 0, 127}));
  connect(product.y, sqrt1.u) annotation(
    Line(points = {{-29, -36}, {-29, -35}, {-25, -35}, {-25, -36}}, color = {0, 0, 127}));
  connect(zeta.y, product1.u2) annotation(
    Line(points = {{-69, -78}, {-9.5, -78}, {-9.5, -64}, {36, -64}}, color = {0, 0, 127}));
  connect(ropeSplDmp.flange_b, mass.flange_a) annotation(
    Line(points = {{80, 14}, {80, 24}}, color = {0, 127, 0}));
  connect(fixed.flange, ropeSplDmp.flange_a) annotation(
    Line(points = {{80, -22}, {80, -6}}, color = {0, 127, 0}));
  connect(ropeSplDmp.unstretched_length, car_height.y) annotation(
    Line(points = {{77, -5.6}, {75, -5.6}, {75, -7.6}, {-29, -7.6}, {-29, 28}, {-77, 28}}, color = {0, 0, 127}));
  connect(sqrt1.y, product2.u1) annotation(
    Line(points = {{-1, -36}, {7, -36}, {7, -46}}, color = {0, 0, 127}));
  connect(coeff1.y, product2.u2) annotation(
    Line(points = {{-69, -58}, {7, -58}}, color = {0, 0, 127}));
  connect(product2.y, product1.u1) annotation(
    Line(points = {{31, -52}, {36, -52}}, color = {0, 0, 127}));
  connect(ropeSplDmp.damping_constant, product1.y) annotation(
    Line(points = {{74, -5.6}, {74, -57.6}, {60, -57.6}}, color = {0, 0, 127}));
  connect(division.y, ropeSplDmp.spring_constant) annotation(
    Line(points = {{3, 22}, {51, 22}, {51, -6}, {71, -6}}, color = {0, 0, 127}));
  connect(car_height.y, add.u2) annotation(
    Line(points = {{-77, 28}, {-58, 28}, {-58, 38}}, color = {0, 0, 127}));
  connect(shaft_height.y, add.u1) annotation(
    Line(points = {{-76, 50}, {-58, 50}}, color = {0, 0, 127}));
  connect(add.y, division.u2) annotation(
    Line(points = {{-34, 44}, {-20, 44}, {-20, 28}}, color = {0, 0, 127}));
annotation(
    Diagram(graphics = {Text(origin = {-17, 47}, extent = {{-15, 3}, {15, -3}}, textString = "Rope length l(t)"), Text(origin = {35, 26}, extent = {{-23, 6}, {23, -6}}, textString = "Spring constant k(t)=EA/l"), Text(origin = {69, -74}, extent = {{-23, 6}, {23, -6}}, textString = "Damping constant
c(t)=zeta 2 sqrt(mk)")}));
end RopeSplDmp_Testing00;