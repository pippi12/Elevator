within Elevator.Components.Testings;

model Car_Testing03
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Mass car_mass = 1000;
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {80, -22}, extent = {{-10, -10}, {10, 10}})));
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
  Modelica.Blocks.Sources.RealExpression shaft_height(y = 100)  annotation(
    Placement(transformation(origin = {-88, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 1, offset = 0, startTime = 10) annotation(
    Placement(transformation(origin = {-164, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 10, height = -1, offset = 0, startTime = 90) annotation(
    Placement(transformation(origin = {-164, 4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Sum sum1(nin = 2) annotation(
    Placement(transformation(origin = {-132, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.Integrator integrator(k = 1, y_start = 10)  annotation(
    Placement(transformation(origin = {-100, 22}, extent = {{-10, -10}, {10, 10}})));
  Elevator.Components.Car car(c = {2e4, 2e4, 1.7e4}, d = {250, 250, 250}, m = {20, 16.7, 10}, m_car = 1000, n = 3, s = {0, 0, 0}, s_start = 10) annotation(
    Placement(transformation(origin = {80, 48}, extent = {{-10, -10}, {10, 10}})));
equation
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
  connect(fixed.flange, ropeSplDmp.flange_a) annotation(
    Line(points = {{80, -22}, {80, -6}}, color = {0, 127, 0}));
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
  connect(shaft_height.y, add.u1) annotation(
    Line(points = {{-76, 50}, {-58, 50}}, color = {0, 0, 127}));
  connect(add.y, division.u2) annotation(
    Line(points = {{-34, 44}, {-20, 44}, {-20, 28}}, color = {0, 0, 127}));
  connect(ramp1.y, sum1.u[1]) annotation(
    Line(points = {{-153, 40}, {-145, 40}, {-145, 22}}, color = {0, 0, 127}));
  connect(ramp2.y, sum1.u[2]) annotation(
    Line(points = {{-153, 4}, {-145, 4}, {-145, 22}}, color = {0, 0, 127}));
  connect(sum1.y, integrator.u) annotation(
    Line(points = {{-121, 22}, {-112, 22}}, color = {0, 0, 127}));
  connect(integrator.y, add.u2) annotation(
    Line(points = {{-89, 22}, {-80.5, 22}, {-80.5, 38}, {-58, 38}}, color = {0, 0, 127}));
  connect(integrator.y, ropeSplDmp.unstretched_length) annotation(
    Line(points = {{-88, 22}, {-72, 22}, {-72, -10}, {78, -10}, {78, -6}}, color = {0, 0, 127}));
  connect(car.flange_a, ropeSplDmp.flange_b) annotation(
    Line(points = {{80, 58}, {80, 14}}, color = {0, 127, 0}));
  annotation(
    Diagram(graphics = {Text(origin = {-17, 47}, extent = {{-15, 3}, {15, -3}}, textString = "Rope length l(t)"), Text(origin = {35, 26}, extent = {{-23, 6}, {23, -6}}, textString = "Spring constant k(t)=EA/l"), Text(origin = {69, -74}, extent = {{-23, 6}, {23, -6}}, textString = "Damping constant
c(t)=zeta 2 sqrt(mk)")}));
end Car_Testing03;