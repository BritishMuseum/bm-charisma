<?xml version="1.0"?>
<root xmlns="http://www.vips.ecs.soton.ac.uk/nip/7.30.0">
  <Workspace window_x="0" window_y="0" window_width="1398" window_height="1050" filename="$HOME/GIT/bm-workspaces/vilcalib.ws" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="426" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;&#10;" name="vilcalib" caption="Default empty workspace">
    <Column x="770" y="0" open="true" selected="false" sform="false" next="6" name="A" caption="import macbeth to linear light">
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
            <iImage window_x="528" window_y="24" window_width="750" window_height="750" image_left="2208" image_top="2022" image_mag="-6" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="6.2592732780298705" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action A4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="16" name="F" caption="input images">
      <Subcolumn vislevel="3">
        <Row popup="false" name="F2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated visible-light reflectance image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F3">
          <Rhs vislevel="1" flags="1">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/65346_viscalib.tif&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F11">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F6">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Visible-induced IR luminescence&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F7">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="454" window_y="33" window_width="750" window_height="750" image_left="1872" image_top="2390" image_mag="-2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/65346_05_Ex.LED+tung_Em.rg830_02.TIF&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F12">
          <Rhs vislevel="1" flags="1">
            <Toggle caption="correct IR image with flatfield" value="false"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Widget_toggle_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F9">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="205" window_y="217" window_width="852" window_height="750" image_left="937" image_top="1856" image_mag="4" show_status="true" show_paintbox="true" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_wbuv_1.TIF&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F13">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F14">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated IR reflectance image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F15">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="1" window_y="52" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/65346_irrcalib.tif&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="577" open="true" selected="false" sform="false" next="12" name="G" caption="results">
      <Subcolumn vislevel="3">
        <Row popup="false" name="G5">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated vis-induced IR luminescence&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="G6">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="588" window_y="28" window_width="779" window_height="922" image_left="1910" image_top="2025" image_mag="-5" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="W4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="G7">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;stray light image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="G8">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Q20"/>
          </Rhs>
        </Row>
        <Row popup="false" name="G10">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;after KM processing&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="G11">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1084" window_y="28" window_width="750" window_height="910" image_left="1840" image_top="1995" image_mag="-5" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="I4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1242" y="0" open="true" selected="false" sform="false" next="4" name="O" caption="import vis-induced IR luminescence image to linear light">
      <Subcolumn vislevel="3">
        <Row popup="false" name="O1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="24" window_width="750" window_height="750" image_left="2232" image_top="1968" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="8.5201806470589823" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O2">
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
            <iText formula="Colour_icc_item.Import_item.action O1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O3">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="528" window_y="24" window_width="750" window_height="750" image_left="2208" image_top="2022" image_mag="-6" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="6.2592732780298705" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action O2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1242" y="525" open="true" selected="false" sform="false" next="8" name="P" caption="flatfield image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="P1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="528" window_y="24" window_width="750" window_height="750" image_left="360" image_top="329" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="P2">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="O3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="P3">
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
            <iText formula="Colour_icc_item.Import_item.action P1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="P4">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action P3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="P5">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="319" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="P4?1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="P6">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="528" window_y="24" window_width="750" window_height="750" image_left="2232" image_top="1956" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Tasks_capture_item.Light_correct_item.action P5 P2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="P7">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="if F12 then P6 else P2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2239" y="0" open="true" selected="false" sform="false" next="22" name="Q" caption="remove stray IR light">
      <Subcolumn vislevel="3">
        <Row popup="false" name="Q21">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;drag Q14 to mark reflectance target&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="4" window_y="24" window_width="750" window_height="750" image_left="2182" image_top="2304" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="T3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q13">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="52" window_width="750" window_height="750" image_left="736" image_top="1490" image_mag="-2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="K7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q14">
          <Rhs vislevel="2" flags="5">
            <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="2135" top="2303" width="71" height="57">
              <iRegiongroup/>
            </iRegion>
            <Subcolumn vislevel="0"/>
            <iText formula="Region Q1 415 1374 71 78"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q9">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="285" window_y="518" window_width="617" window_height="363" image_left="75" image_top="31" image_mag="4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
                        <iText formula="Q14.left "/>
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
                        <iText formula="Q14.top "/>
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
                        <iText formula="Q14.width "/>
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
                        <iText formula="Q14.height "/>
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
            <iText formula="Image_crop_item.action Q13"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q12">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;percent of stray light&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q15">
          <Rhs vislevel="1" flags="1">
            <iText formula="Vector (map mean (bandsplit Q14))"/>
            <Vector/>
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q17">
          <Rhs vislevel="1" flags="1">
            <iText formula="Vector (map mean (bandsplit Q9))"/>
            <Vector/>
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q18">
          <Rhs vislevel="2" flags="5">
            <iText formula="100 * Q15 / Q17"/>
            <Vector/>
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q19">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="(Q18 / 100) * Q13"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q5">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="57" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Q1 - Q19"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q20">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.sRGB_item.action Q19"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1816" y="0" open="true" selected="false" sform="false" next="4" name="T" caption="align vis-induced IR luminescence to visible">
      <Subcolumn vislevel="3">
        <Row popup="false" name="T1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="915" window_y="56" window_width="750" window_height="750" image_left="1883" image_top="363" image_mag="2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="A5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="T2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="136" window_y="85" window_width="750" window_height="750" image_left="1895" image_top="332" image_mag="2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="P7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="T3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="x">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="y">
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
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="1869" top="358" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="1878" top="349" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="180" top="3780" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="184" top="3793" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="refine">
                <Rhs vislevel="1" flags="1">
                  <Toggle/>
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
            <iText formula="Image_transform_item.Match_item.action T1 T2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1816" y="582" open="true" selected="false" sform="false" next="4" name="U" caption="test alignment">
      <Subcolumn vislevel="3">
        <Row popup="false" name="U1">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="T3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="U2">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="T1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="U3">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="1231" window_y="218" window_width="750" window_height="750" image_left="2170" image_top="654" image_mag="4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="T3?1 ++ U2?1 ++ 0"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2239" y="1921" open="true" selected="false" sform="false" next="6" name="W" caption="back to RGB">
      <Subcolumn vislevel="3">
        <Row popup="false" name="W1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="2226" image_top="630" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C6"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Source image is 16-bit?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W3">
          <Rhs vislevel="1" flags="4">
            <iText formula="F7.format == 2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W4">
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
                <Rhs vislevel="2" flags="5">
                  <Option caption="Output depth" labelsn="2" labels0="8 bit" labels1="16 bit" value="1"/>
                  <Subcolumn vislevel="0"/>
                  <iText formula="Option (_ &quot;Output depth&quot;) [_ &quot;8 bit&quot;, _ &quot;16 bit&quot;] (if W3 then 1 else 0)"/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_icc_item.Export_item.action W1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W5">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.sRGB_item.action W4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2833" y="0" open="true" selected="false" sform="false" next="22" name="J" caption="kubelka munk">
      <Subcolumn vislevel="3">
        <Row popup="false" name="J1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="368" image_top="669" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="A5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="173" window_y="141" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Q5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J20">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="K7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J21">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J3">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1">
              <Row name="default_colour">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="default_value">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <Colour/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="space">
                <Rhs vislevel="1" flags="1">
                  <Option/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="colour">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Colour value"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="[100, 0, 0]"/>
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
            <iText formula="Colour_new_item.Widget_colour_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J4">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action J3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J5">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="733" window_y="95" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="J1 / J4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J13">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1085" window_y="100" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="(1 - J5) ** 2 / (2 * J5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J15">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1069" window_y="70" window_width="750" window_height="750" image_left="1239" image_top="1749" image_mag="-3" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="75.401759631879372" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="J20 / J4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J18">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="4.9842813694681078" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="(1 - J15) ** 2 / (2 * J15)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J14">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="27.295051938857174" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="1 / (1 + (J18 / (J18 + 2)) ** 0.5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J19">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="11.952023241406405" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="1 / (1 + ( (J18 * (J18 + 2)) / (J13 * (J13 + 2)) ) ** 0.5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J17">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="663" window_y="179" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="0.5 * J2 / (J14 * J19)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2833" y="2299" open="true" selected="false" sform="false" next="6" name="I" caption="back to RGB">
      <Subcolumn vislevel="3">
        <Row popup="false" name="I1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="24" window_width="750" window_height="750" image_left="2208" image_top="2022" image_mag="-6" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="E6"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Source image is 16-bit?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I3">
          <Rhs vislevel="1" flags="4">
            <iText formula="F7.format == 2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I4">
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
                <Rhs vislevel="2" flags="5">
                  <Option caption="Output depth" labelsn="2" labels0="8 bit" labels1="16 bit" value="1"/>
                  <Subcolumn vislevel="0"/>
                  <iText formula="Option (_ &quot;Output depth&quot;) [_ &quot;8 bit&quot;, _ &quot;16 bit&quot;] (if I3 then 1 else 0)"/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_icc_item.Export_item.action I1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I5">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1091" window_y="84" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.sRGB_item.action I1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="770" y="525" open="true" selected="false" sform="false" next="9" name="K" caption="import IR reflectance to linear light">
      <Subcolumn vislevel="3">
        <Row popup="false" name="K1">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F15"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K2">
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
            <iText formula="Colour_icc_item.Import_item.action K1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K3">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="368" image_top="1327" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action K2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K5">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1">
              <Row name="default_colour">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="default_value">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <Colour/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="space">
                <Rhs vislevel="1" flags="1">
                  <Option/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="colour">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Colour value"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="[100, 0, 0]"/>
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
            <iText formula="Colour_new_item.Widget_colour_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K6">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action K5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K7">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="K6 * (K3 / K6)?0"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="1078" open="true" selected="false" sform="false" next="9" name="M" caption="before and after comparison">
      <Subcolumn vislevel="3">
        <Row popup="false" name="M1">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="F7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="M2">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="G6"/>
          </Rhs>
        </Row>
        <Row popup="false" name="M3">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="4" window_y="136" window_width="750" window_height="750" image_left="827" image_top="319" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="G11"/>
          </Rhs>
        </Row>
        <Row popup="false" name="M4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="2" window_y="80" window_width="750" window_height="750" image_left="2944" image_top="2552" image_mag="-8" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Image_join_item.Left_right_item.action M1 M2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="M5">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="368" image_top="319" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Image_join_item.Left_right_item.action M4 M3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="M6">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.sRGB_item.action M5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="M7">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1" window_y="52" window_width="1538" window_height="751" image_left="762" image_top="320" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
              <Row name="which">
                <Rhs vislevel="1" flags="1">
                  <Option caption="Resize axis" labelsn="4" labels0="Shortest" labels1="Longest" labels2="Horizontal" labels3="Vertical" value="0"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="size">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Resize to (pixels)"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="333"/>
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
              <Row name="aspect">
                <Rhs vislevel="1" flags="1">
                  <Toggle/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="interp">
                <Rhs vislevel="2" flags="6">
                  <Subcolumn vislevel="1"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_transform_item.Resize_item.Size_item.action M6"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2239" y="1187" open="true" selected="false" sform="false" next="7" name="C" caption="take just X of XYZ IR reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C1">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Q5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1">
              <Row name="default_colour">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="default_value">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <Colour/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="space">
                <Rhs vislevel="1" flags="1">
                  <Option/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="colour">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Colour value"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="[100, 0, 0]"/>
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
            <iText formula="Colour_new_item.Widget_colour_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C3">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action C2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C4">
          <Rhs vislevel="1" flags="1">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C1 / C3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C5">
          <Rhs vislevel="1" flags="1">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C4?0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C6">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="2" window_y="80" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C5 * C3"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2833" y="1538" open="true" selected="false" sform="false" next="7" name="E" caption="take just X of XYZ IR image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="E1">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="J17"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E2">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1">
              <Row name="default_colour">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="default_value">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <Colour/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="space">
                <Rhs vislevel="1" flags="1">
                  <Option/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="colour">
                <Rhs vislevel="1" flags="1">
                  <Expression caption="Colour value"/>
                  <Subcolumn vislevel="0">
                    <Row name="caption">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="expr">
                      <Rhs vislevel="0" flags="4">
                        <iText formula="[100, 0, 0]"/>
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
            <iText formula="Colour_new_item.Widget_colour_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E3">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action E2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E4">
          <Rhs vislevel="1" flags="1">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="E1 / E3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E5">
          <Rhs vislevel="1" flags="1">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="E4?0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E6">
          <Rhs vislevel="1" flags="1">
            <iImage window_x="2" window_y="80" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="E5 * E3"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
</root>



