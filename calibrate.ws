<?xml version="1.0"?>
<root xmlns="http://www.vips.ecs.soton.ac.uk/nip/7.30.0">
  <Workspace window_x="0" window_y="0" window_width="1918" window_height="1051" filename="$HOME/GIT/bm-workspaces/calibrate.ws" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="100" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;" name="calibrate" caption="Default empty workspace">
    <Column x="539" y="0" open="true" selected="false" sform="false" next="6" name="A" caption="import macbeth to linear light">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="24" window_width="750" window_height="750" image_left="2232" image_top="1968" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="8.5201806470589823" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A4">
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
            <iText formula="Colour_icc_item.Import_item.action A1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A5">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="528" window_y="24" window_width="750" window_height="750" image_left="2410" image_top="1993" image_mag="2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="6.2592732780298705" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action A4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1071" y="0" open="true" selected="false" sform="false" next="7" name="B" caption="straighten and extract Macbeth and white standard">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="528" window_y="27" window_width="750" window_height="750" image_left="368" image_top="1686" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B2">
          <Rhs vislevel="1" flags="1">
            <iArrow left="258" top="1590" width="16" height="947">
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="Arrow B1 2218 2666 10 (-526)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B3">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="528" window_y="27" window_width="750" window_height="750" image_left="2208" image_top="2022" image_mag="-6" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
              <Row name="interp">
                <Rhs vislevel="2" flags="6">
                  <Subcolumn vislevel="1">
                    <Row name="default">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="interp">
                      <Rhs vislevel="1" flags="1">
                        <Option caption="Interpolation" labelsn="6" labels0="Nearest neighbour" labels1="Bilinear" labels2="Bicubic" labels3="Upsize: reduced halo bicubic (LBB)" labels4="Upsharp: reduced halo bicubic with edge sharpening (Nohalo)" labels5="Upsmooth: quadratic B-splines with jaggy reduction (VSQBS)" value="2"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_transform_item.Rotate_item.Straighten_item.action B2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B4">
          <Rhs vislevel="1" flags="1">
            <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="264" top="1572" width="648" height="990">
              <iRegiongroup/>
            </iRegion>
            <Subcolumn vislevel="0"/>
            <iText formula="Region B3 2112 2124 414 576"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B5">
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
            <iText formula="Image_transform_item.Rotate_item.Fixed_item.Rot90_item.action B4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="539" y="525" open="true" selected="false" sform="false" next="8" name="C" caption="flatfield macbeth">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="528" window_y="24" window_width="750" window_height="750" image_left="360" image_top="329" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C3">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="A5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C4">
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
        <Row popup="false" name="C5">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action C4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="2" window_y="83" window_width="750" window_height="750" image_left="368" image_top="319" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C5?1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C6">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="528" window_y="27" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Tasks_capture_item.Light_correct_item.action C2 C3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C7">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="if F10 then C6 else C3"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1071" y="606" open="true" selected="false" sform="false" next="10" name="D" caption="generate calibration matrix">
      <Subcolumn vislevel="3">
        <Row popup="false" name="D1">
          <Rhs vislevel="2" flags="5">
            <Subcolumn vislevel="0"/>
            <iText formula="B5"/>
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D8">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="0" window_y="29" window_width="740" window_height="584" image_left="363" image_top="236" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="image">
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
              <Row name="macbeth">
                <Rhs vislevel="1" flags="1">
                  <Pathname/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="mode">
                <Rhs vislevel="1" flags="1">
                  <Option caption="Input LUT" labelsn="4" labels0="Linearize from chart greyscale" labels1="Fit intercept from chart greyscale" labels2="Linear input, set brightness from chart" labels3="Linear input" value="2"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="linearising_lut">
                <Rhs vislevel="1" flags="1">
                  <Plot plot_left="0" plot_top="0" plot_mag="100" show_status="false"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="M">
                <Rhs vislevel="1" flags="1">
                  <Matrix/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="scale">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="avg_dE76">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="worst_patch">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Tasks_capture_item.Find_calib_item.action D1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action D8"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2363" y="0" open="true" selected="false" sform="false" next="18" name="E" caption="Apply calibration to input image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="E1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="368" image_top="1287" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="I7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E2">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="D8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E14">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Tasks_capture_item.Apply_calib_item.action E2 E1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E17">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="368" image_top="1437" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action E14"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="13" name="F" caption="input images">
      <Subcolumn vislevel="3">
        <Row popup="false" name="F2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;macbeth image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F3">
          <Rhs vislevel="1" flags="1">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_idas_1.TIF&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F10">
          <Rhs vislevel="1" flags="1">
            <Toggle caption="correct macbeth with flatfield" value="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Widget_toggle_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F5">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="160" window_y="52" window_width="852" window_height="750" image_left="2012" image_top="843" image_mag="1" show_status="true" show_paintbox="true" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_wb_1.TIF&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F12">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F6">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;image to calibrate&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F7">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="454" window_y="33" window_width="750" window_height="750" image_left="1872" image_top="2390" image_mag="-2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F11">
          <Rhs vislevel="1" flags="1">
            <Toggle caption="correct image with flatfield" value="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Widget_toggle_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F9">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="205" window_y="217" window_width="852" window_height="750" image_left="937" image_top="1856" image_mag="4" show_status="true" show_paintbox="true" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F5"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="568" open="true" selected="true" sform="false" next="6" name="G" caption="result">
      <Subcolumn vislevel="3">
        <Row popup="false" name="G1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="36" window_y="64" window_width="750" window_height="750" image_left="736" image_top="1280" image_mag="-2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="K4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="G4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="2224" image_top="1232" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1.0285767679447775" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.sRGB_item.action G1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1833" y="0" open="true" selected="false" sform="false" next="4" name="H" caption="import image to linear light">
      <Subcolumn vislevel="3">
        <Row popup="false" name="H1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="24" window_width="750" window_height="750" image_left="2232" image_top="1968" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="8.5201806470589823" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="H2">
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
            <iText formula="Colour_icc_item.Import_item.action H1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="H3">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="528" window_y="24" window_width="750" window_height="750" image_left="2410" image_top="1993" image_mag="2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="6.2592732780298705" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action H2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1833" y="525" open="true" selected="false" sform="false" next="8" name="I" caption="flatfield image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="I1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="528" window_y="24" window_width="750" window_height="750" image_left="360" image_top="329" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I2">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="H3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I3">
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
            <iText formula="Colour_icc_item.Import_item.action I1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I4">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action I3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I5">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="319" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="I4?1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I6">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="528" window_y="24" window_width="750" window_height="750" image_left="2232" image_top="1956" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Tasks_capture_item.Light_correct_item.action I5 I2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I7">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="if F11 then I6 else I2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2363" y="545" open="true" selected="false" sform="false" next="5" name="K" caption="back to RGB">
      <Subcolumn vislevel="3">
        <Row popup="false" name="K1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="368" image_top="1337" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="E17"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Source image is 16-bit?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K3">
          <Rhs vislevel="1" flags="4">
            <iText formula="F7.format == 2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="528" window_y="27" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
                  <iText formula="Option (_ &quot;Output depth&quot;) [_ &quot;8 bit&quot;, _ &quot;16 bit&quot;] (if K3 then 1 else 0) "/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_icc_item.Export_item.action K1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
</root>



