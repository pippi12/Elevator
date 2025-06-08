within Elevator.Components;

model RopeSplDmp
  import Modelica.Units.SI;
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
  Modelica.Blocks.Interfaces.RealInput spring_constant annotation(
    Placement(transformation(origin = {-108, 90}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-96, 90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput unstretched_length annotation(
    Placement(transformation(origin = {-108, 30}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-96, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput damping_constant annotation(
    Placement(transformation(origin = {-108, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-96, 60}, extent = {{-10, -10}, {10, 10}})));
protected
  SI.Force f_c "Spring force";
  SI.Force f_d "Damping force";

  SI.TranslationalSpringConstant c(final min=0, start=1)
    "Spring constant";
  SI.TranslationalDampingConstant d(final min=0, start=1)
    "Damping constant";
  SI.Distance s_rel0 "Unstretched spring length";

equation
  c = spring_constant;
  d = damping_constant;
  s_rel0 = unstretched_length;
  
  f_c = c*(s_rel - s_rel0);
  f_d = d*v_rel;
  f = f_c + f_d;
  lossPower = f_d*v_rel;
  annotation (
    Documentation(info="<html>
<p>
A <em>spring and damper element connected in parallel</em>.
The component can be
connected either between two sliding masses to describe the elasticity
and damping, or between a sliding mass and the housing (model Fixed),
to describe a coupling of the sliding mass with the housing via a spring/damper.
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={
        Line(points={{-80,40},{-60,40},{-45,10},{-15,70},{15,10},{45,70},{
              60,40},{80,40}}, color={0,127,0}),
        Line(points={{-80,40},{-80,-70},{80,-70},{80,40}}, color={0,127,0}),
        Line(points={{-90,0},{-80,0}}, color={0,127,0}),
        Line(points={{80,0},{90,0}}, color={0,127,0}),
        Polygon(
          points={{53,-20},{23,-10},{23,-30},{53,-20}},
          lineColor={95,127,95},
          fillColor={95,127,95},
          fillPattern=FillPattern.Solid),
        Line(points={{-57,-20},{23,-20}}, color={95,127,95}),
        Text(
          extent={{-150,120},{150,80}},
          textString="%name",
          textColor={0,0,255}),
        Text(
          extent={{-150,-135},{150,-165}},
          textString="d=%d"),
        Text(
          extent={{-150,-100},{150,-130}},
          textString="c=%c"),
        Line(
          visible=useHeatPort,
          points={{-100,-100},{-100,-80},{-5,-80}},
          color={191,0,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-50,-50},{40,-90}},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          lineColor={0,127,0}), Line(points={{70,-90},{-50,-90},{-50,-50},{70,-50}}, color={0,127,0})}));

end RopeSplDmp;