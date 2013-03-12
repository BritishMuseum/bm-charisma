<?xml version="1.0"?>
<root xmlns="http://www.vips.ecs.soton.ac.uk/nip/7.31.0">
  <Workspace window_x="0" window_y="0" window_width="1918" window_height="1051" filename="$HOME/GIT/bm-workspaces/false-colour.ws" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="100" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;" name="falsecolour" caption="Default empty workspace">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="8" name="A" caption="input images">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A3">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated visible light image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A1">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="1840" image_top="1595" image_mag="-5" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_viscalib.tif&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A4">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;UV or IR reflectance image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A2">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="2" window_y="83" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_dug11_1-full.TIF&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A7">
          <Rhs vislevel="1" flags="1">
            <Toggle caption="correct UV or iR image with flatfield" value="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Widget_toggle_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A6">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="319" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_wbuv_1.TIF&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="560" y="0" open="true" selected="false" sform="false" next="6" name="B" caption="linearise mono">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="647" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="A2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B2">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="x">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="embedded">
                <Rhs vislevel="1" flags="1">
                  <Toggle caption="Use embedded profile if possible" value="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="profile">
                <Rhs vislevel="1" flags="1">
                  <Pathname/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="intent">
                <Rhs vislevel="1" flags="1">
                  <Option caption="Render intent" labelsn="4" labels0="Perceptual" labels1="Relative" labels2="Saturation" labels3="Absolute" value="1"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_icc_item.Import_item.action B1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B3">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="573" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action B2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1119" y="0" open="true" selected="false" sform="false" next="4" name="C" caption="linearize visible">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C1">
          <Rhs vislevel="1" flags="1">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="A1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="x">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="embedded">
                <Rhs vislevel="1" flags="1">
                  <Toggle caption="Use embedded profile if possible" value="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="profile">
                <Rhs vislevel="1" flags="1">
                  <Pathname/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="intent">
                <Rhs vislevel="1" flags="1">
                  <Option caption="Render intent" labelsn="4" labels0="Perceptual" labels1="Relative" labels2="Saturation" labels3="Absolute" value="1"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_icc_item.Import_item.action C1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action C2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="3234" y="0" open="true" selected="false" sform="false" next="22" name="F" caption="create false-colour image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="F2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="2" window_y="27" window_width="750" window_height="1024" image_left="1130" image_top="1686" image_mag="-2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="A1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="869" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="K4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F9">
          <Rhs vislevel="1" flags="1">
            <iText formula="Option &quot;Combine bands as&quot; [&quot;X - RG&quot;, &quot;GB - X&quot;] 0"/>
            <Option caption="Combine bands as" labelsn="2" labels0="X - RG" labels1="GB - X" value="1"/>
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F10">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1152" window_y="77" window_width="750" window_height="1024" image_left="2208" image_top="2736" image_mag="-6" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="[F1?0 ++ F2?0 ++ F2?1, F2?1 ++ F2?2 ++ F1?2]?F9"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1644" y="0" open="true" selected="false" sform="false" next="5" name="G" caption="align mono with vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="G1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="48" window_y="167" window_width="750" window_height="750" image_left="203" image_top="2596" image_mag="8" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="G2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="984" window_y="138" window_width="750" window_height="750" image_left="3772" image_top="205" image_mag="4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="I5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="G3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="x">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="y">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="3759" top="206" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="3752" top="203" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="207" top="2594" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="184" top="2600" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="refine">
                <Rhs vislevel="1" flags="1">
                  <Toggle caption="Refine selected tie-points" value="false"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="lock">
                <Rhs vislevel="1" flags="1">
                  <Toggle/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_transform_item.Match_item.action G1 G2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="399" open="true" selected="true" sform="false" next="10" name="H" caption="final result">
      <Subcolumn vislevel="3">
        <Row popup="false" name="H7">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;false colour UV/IR image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="H1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="782" window_y="85" window_width="750" window_height="834" image_left="736" image_top="2978" image_mag="-2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="H8">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated UV/IR reflectance image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="H6">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="571" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="K4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="560" y="1050" open="true" selected="false" sform="false" next="6" name="I" caption="flatfield mono">
      <Subcolumn vislevel="3">
        <Row popup="false" name="I2">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="J3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I1">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="B3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I4">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="I2?1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I3">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="19" window_y="55" window_width="750" window_height="750" image_left="368" image_top="1219" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Tasks_capture_item.Light_correct_item.action I4 I1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I5">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="if A7 then I3 else I1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="560" y="525" open="true" selected="false" sform="false" next="4" name="J" caption="linearise flatfield">
      <Subcolumn vislevel="3">
        <Row popup="false" name="J1">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="A6"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J2">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="x">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="embedded">
                <Rhs vislevel="1" flags="1">
                  <Toggle caption="Use embedded profile if possible" value="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="profile">
                <Rhs vislevel="1" flags="1">
                  <Pathname/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="intent">
                <Rhs vislevel="1" flags="1">
                  <Option caption="Render intent" labelsn="4" labels0="Perceptual" labels1="Relative" labels2="Saturation" labels3="Absolute" value="1"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_icc_item.Import_item.action J1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action J2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2839" y="0" open="true" selected="false" sform="false" next="5" name="K" caption="take mono back to sRGB">
      <Subcolumn vislevel="3">
        <Row popup="false" name="K1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="52" window_width="750" window_height="750" image_left="2208" image_top="1914" image_mag="-6" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="O25"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;A1 is a 16-bit image?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K3">
          <Rhs vislevel="1" flags="4">
            <iText formula="A1.format == 2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1" window_y="55" window_width="750" window_height="750" image_left="736" image_top="1438" image_mag="-2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="x">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="profile">
                <Rhs vislevel="1" flags="1">
                  <Pathname caption="Output profile" value="$VIPSHOME/share/nip2/data/sRGB.icm"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="intent">
                <Rhs vislevel="1" flags="1">
                  <Option caption="Render intent" labelsn="4" labels0="Perceptual" labels1="Relative" labels2="Saturation" labels3="Absolute" value="1"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="depth">
                <Rhs vislevel="1" flags="1">
                  <Option/>
                  <Subcolumn vislevel="0"/>
                  <iText formula="Option (_ &quot;Output depth&quot;) [_ &quot;8 bit&quot;, _ &quot;16 bit&quot;] (if K3 then 1 else 0)"/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_icc_item.Export_item.action K1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2067" y="0" open="true" selected="false" sform="false" next="26" name="O" caption="match brightness of mono to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="O1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="1472" image_top="1276" image_mag="-4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="1369" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="G3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O4">
          <Rhs vislevel="2" flags="5">
            <iArrow left="306" top="1512" width="-12" height="-1342">
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="Arrow O1 336 1904 4 (-1308)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O5">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="1472" image_top="1276" image_mag="-4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Image_transform_item.Rotate_item.Straighten_item.action O4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O6">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Mark edge of spectralon target:&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O7">
          <Rhs vislevel="1" flags="1">
            <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="328" top="180" width="324" height="1324">
              <iRegiongroup/>
            </iRegion>
            <Subcolumn vislevel="0"/>
            <iText formula="Region O5 357 1925 245 819"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O8">
          <Rhs vislevel="0" flags="4">
            <iArrow>
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_new_item.Image_region_item.Move_item.action O2 O4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O9">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Image_transform_item.Rotate_item.Straighten_item.action O8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O10">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1" window_y="52" window_width="482" window_height="750" image_left="234" image_top="1004" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="x">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="l">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Crop left"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="O7.left"/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="t">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Crop top"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="O7.top"/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="w">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Crop width"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="O7.width"/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="h">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Crop height"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="O7.height"/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="geo">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_crop_item.action O9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O14">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="default">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="x">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <Subcolumn vislevel="0"/>
                  <iText/>
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                </Rhs>
              </Row>
              <Row name="angle">
                <Rhs vislevel="1" flags="1">
                  <Option caption="Rotate by" labelsn="4" labels0="Don't rotate" labels1="90 degrees clockwise" labels2="180 degrees" labels3="90 degrees anticlockwise" value="1"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_transform_item.Rotate_item.Fixed_item.Rot90_item.action O7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O15">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="default">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="x">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="angle">
                <Rhs vislevel="2" flags="5">
                  <Subcolumn vislevel="0"/>
                  <iText formula="O14.angle"/>
                  <Option/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_transform_item.Rotate_item.Fixed_item.Rot90_item.action O10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O16">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1">
              <Row name="x">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <Matrix/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="pacross">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Patches across chart"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="8"/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="pdown">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Patches down chart"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="1"/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_chart_to_matrix_item.action O14"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O17">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1">
              <Row name="x">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <Matrix/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="pacross">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Patches across chart"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="8"/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="pdown">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Patches down chart"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="1"/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_chart_to_matrix_item.action O15"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O18">
          <Rhs vislevel="1" flags="1">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_transpose_item.action O16"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O19">
          <Rhs vislevel="1" flags="1">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_transpose_item.action O17"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O20">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg O19.value?0 O18.value?0"/>
            <Subcolumn vislevel="1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O21">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg O19.value?1 O18.value?1"/>
            <Subcolumn vislevel="1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O22">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg O19.value?2 O18.value?2"/>
            <Subcolumn vislevel="1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O23">
          <Rhs vislevel="1" flags="1">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector [O20.slope, O21.slope, O22.slope]"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O24">
          <Rhs vislevel="1" flags="1">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector [O20.intercept, O21.intercept, O22.intercept]"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O25">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="669" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="O2 * O23 + O24"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
</root>



