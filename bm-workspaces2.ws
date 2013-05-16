<?xml version="1.0"?>
<root xmlns="http://www.vips.ecs.soton.ac.uk/nip/7.33.0">
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;get_option options defaults f&#10;    = error (_ &quot;unknown parameter &quot; ++ f), hits == []&#10;    = hits?0&#10;{&#10;    hits = [v :: [n, v] &lt;- options ++ defaults; n == f];&#10;}&#10;&#10;mkim options x y b&#10;    = Image (image_new x y b&#10;        (opt $format) (opt $coding) (opt $type)&#10;        (opt $pixel)&#10;        (opt $xoffset) (opt $yoffset))&#10;{&#10;    opt = get_option options [&#10;        $format =&gt; Image_format.UCHAR,&#10;        $coding =&gt; Image_coding.NOCODING,&#10;        $type =&gt; Image_type.sRGB,&#10;        $pixel =&gt; 0,&#10;        $xoffset =&gt; 0,&#10;        $yoffset =&gt; 0&#10;    ];&#10;}&#10;&#10;Pair_flatfield _i label = class {&#10;    _vislevel = 3;&#10;&#10;    image &#10;&#9;&#9;= mkim [] 10 10 3, NULL == _i&#10;&#9;&#9;= _i;&#10;    use_flatfield = Toggle (&quot;Flatfield &quot; ++ label ++ &quot; image&quot;) false;&#10;    flatfield = mkim [$pixel =&gt; 200] image.width image.height 3;&#10;}&#10;&#10;Pair_load label = class {&#10;&#9;_vislevel = 2;&#10;&#9;targets = Pair_flatfield NULL (label ++ &quot; with calibration targets&quot;);&#10;&#9;object = Pair_flatfield (targets.image) (label ++ &quot; of object&quot;);&#10;}&#10;" name="input" caption="all the source images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="681" y="0" open="true" selected="false" sform="false" next="3" name="E" caption="IR reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="E2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1">
              <Row name="label">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="targets">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2">
                    <Row name="label">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_rg830_sp.tif&quot;"/>
                      </Rhs>
                    </Row>
                    <Row name="use_flatfield">
                      <Rhs vislevel="1" flags="1">
                        <Toggle/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="flatfield">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="object">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2">
                    <Row name="label">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_rg830.tif&quot;"/>
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                      </Rhs>
                    </Row>
                    <Row name="use_flatfield">
                      <Rhs vislevel="1" flags="1">
                        <Toggle/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="flatfield">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Pair_load &quot;IR reflectance&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1352" y="0" open="true" selected="false" sform="false" next="1" name="F" caption="UV reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="F2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1">
              <Row name="label">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="targets">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2">
                    <Row name="label">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_dug11x_sp.tif&quot;"/>
                      </Rhs>
                    </Row>
                    <Row name="use_flatfield">
                      <Rhs vislevel="1" flags="1">
                        <Toggle/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="flatfield">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="object">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2">
                    <Row name="label">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_dug11x.tif&quot;"/>
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                      </Rhs>
                    </Row>
                    <Row name="use_flatfield">
                      <Rhs vislevel="1" flags="1">
                        <Toggle/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="flatfield">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Pair_load &quot;UV reflectance&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2031" y="0" open="true" selected="false" sform="false" next="3" name="G" caption="UV-induced visible luminescence">
      <Subcolumn vislevel="3">
        <Row popup="false" name="G2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1">
              <Row name="label">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="targets">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2">
                    <Row name="label">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_idas_kv418_sp.tif&quot;"/>
                      </Rhs>
                    </Row>
                    <Row name="use_flatfield">
                      <Rhs vislevel="1" flags="1">
                        <Toggle/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="flatfield">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="object">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2">
                    <Row name="label">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_idas_kv418.tif&quot;"/>
                      </Rhs>
                    </Row>
                    <Row name="use_flatfield">
                      <Rhs vislevel="1" flags="1">
                        <Toggle/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="flatfield">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Pair_load &quot;UV-induced visible luminescence&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2806" y="0" open="true" selected="true" sform="false" next="1" name="H" caption="visible-induced IR luminescence">
      <Subcolumn vislevel="3">
        <Row popup="false" name="H2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair_load &quot;visible-induced IR luminescence&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="11" name="A" caption="visible-light reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1">
              <Row name="label">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="targets">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2">
                    <Row name="label">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_idas_sp.tif&quot;"/>
                      </Rhs>
                    </Row>
                    <Row name="use_flatfield">
                      <Rhs vislevel="1" flags="1">
                        <Toggle/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="flatfield">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="object">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2">
                    <Row name="label">
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="super">
                      <Rhs vislevel="1" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_idas.tif&quot;"/>
                      </Rhs>
                    </Row>
                    <Row name="use_flatfield">
                      <Rhs vislevel="1" flags="1">
                        <Toggle/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="flatfield">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Pair_load &quot;visible reflectance&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="587" open="true" selected="false" sform="false" next="5" name="I" caption="save output images as 16-bits?">
      <Subcolumn vislevel="3">
        <Row popup="false" name="I3">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Typical input image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I1">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="A2.targets.image"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I2">
          <Rhs vislevel="2" flags="5">
            <iText formula="Toggle &quot;Output format is 16-bit&quot; (get_format I1 == 2)"/>
            <Toggle/>
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="depth">
          <Rhs vislevel="1" flags="4">
            <iText formula="if I2.value then 16 else 8"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;// correct :: Pair_flatfield -&gt; Image&#10;correct pff&#10;&#9;= wc flat?1 im, pff.use_flatfield&#10;&#9;= im&#10;{&#10;&#9;import x&#10;&#9;&#9;= icc_import_embedded Render_intent.RELATIVE x, &#10;&#9;&#9;&#9;&#9;get_header_type &quot;icc-profile-data&quot; x != 0;&#10;&#9;&#9;= icc_import &quot;$VIPSHOME/share/$PACKAGE/data/sRGB.icm&quot; Render_intent.RELATIVE x;&#10;&#9;import_xyz = colour_transform_to Image_type.XYZ @ import;&#10;&#10;&#9;im = import_xyz pff.image;&#10;&#9;flat = import_xyz pff.flatfield;&#10;&#10;&#9;wc w i&#10;&#9;&#9;= clip2fmt i.format (w' * i)&#10;&#9;{&#10;&#9;&#9;fac = mean w / max w;&#10;&#9;&#9;w' = fac * (max w / w);&#10;&#9;}&#10;}&#10;&#10;// Correct_pair :: Pair_load -&gt; Pair &#10;Correct_pair pl = class {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = pl.label;&#10;&#9;targets_label = pl.targets.label;&#10;&#9;targets = correct pl.targets;&#10;&#9;object_label = pl.object.label;&#10;&#9;object = correct pl.object;&#10;}&#10;&#10;// Mono_pair :: Pair -&gt; Pair&#10;Mono_pair band p =&#9;class { &#10;&#9;_vislevel = 2;&#10;&#10;&#9;_lab = Colour &quot;Lab&quot; [100, 0, 0];&#10;&#9;_xyz = colour_transform_to Image_type.XYZ _lab;&#10;&#9;mono x = _xyz * (x / _xyz) ? band;&#10;&#10;&#9;label = p.label;&#10;&#9;targets_label = p.targets_label ++ &quot;, just band &quot; ++ print band;&#10;&#9;targets = mono p.targets;&#10;&#9;object_label = p.object_label ++ &quot;, just band &quot; ++ print band;&#10;&#9;object = mono p.object;&#10;&#10;}" name="linear" caption="linearize and flatfield all images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="18" name="J" caption="import and flatfield">
      <Subcolumn vislevel="3">
        <Row popup="false" name="J2">
          <Rhs vislevel="2" flags="4">
            <iText formula="map Correct_pair [input.A2, input.E2, input.F2, input.G2, input.H2]"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J13">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="J2?0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J14">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="J2?1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J15">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="J2?2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J16">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="J2?3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J17">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="J2?4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="228" y="0" open="true" selected="true" sform="false" next="10" name="K" caption="mono-ize IR and UV images">
      <Subcolumn vislevel="3">
        <Row popup="false" name="K8">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Mono_pair 0 J14"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Mono_pair 2 J15"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K9">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Mono_pair 0 J17"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;straighten arrow&#10;&#9;= rotate Interpolate_bilinear angle'' arrow.image&#10;{&#10;&#9;x = arrow.width;&#10;&#9;y = arrow.height;&#10;&#10;&#9;angle = im (polar (x, y));&#10;&#9;&#9;&#10;&#9;angle'&#10;&#9;&#9;= angle - 360, angle &gt; 315&#10;&#9;&#9;= angle - 180, angle &gt; 135&#10;&#9;&#9;= angle;&#10;&#9;&#9;&#10;&#9;angle''&#10;&#9;&#9;= -angle', angle' &gt;= (-45) &amp;&amp; angle' &lt; 45&#10;&#9;&#9;= 90 - angle';&#10;}&#10;&#10;rotate_widget = Image_transform_item.Rotate_item.Fixed_item.rotate_widget;&#10;&#10;Markup_macbeth pair = class {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;straighten_prompt = &quot;Position line along edge of Macbeth in &quot; ++ pair.label;&#10;&#9;straighten_image = copy pair.targets;&#10;&#9;line &#10;&#9;&#9;= Arrow straighten_image x y w h&#10;&#9;{&#10;&#9;&#9;x = pair.targets.width / 4;&#10;&#9;&#9;y = pair.targets.height / 2;&#10;&#9;&#9;w = pair.targets.width / 2;&#10;&#9;&#9;h = 0;&#10;&#9;}&#10;&#10;&#9;enclose_prompt = &quot;Enclose the Macbeth with box&quot;;&#10;&#9;box_image = straighten line;&#10;&#9;box &#10;&#9;&#9;= Region box_image x y w h &#10;&#9;{&#10;&#9;&#9;x = box_image.width / 4;&#10;&#9;&#9;y = box_image.height / 4;&#10;&#9;&#9;w = box_image.width / 2;&#10;&#9;&#9;h = box_image.height / 2;&#10;&#9;}&#10;&#10;&#9;rotate_prompt = &quot;Rotate the Macbeth to get white at the bottom-left&quot;;&#10;&#9;rotate &#10;&#9;&#9;= rotate_widget 0 box;&#10;}&#10;&#10;Markup_reflectance default pair =&#9;class {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;straighten_prompt = &quot;Position line along edge of reflectance standard in &quot; ++ pair.label;&#10;&#9;straighten_image = copy pair.targets;&#10;&#9;line &#10;&#9;&#9;= Arrow straighten_image x y w h, NULL == default&#10;&#9;&#9;= Arrow straighten_image default.line.left default.line.top &#10;&#9;&#9;&#9;default.line.width default.line.height&#10;&#9;{&#10;&#9;&#9;x = pair.targets.width / 4;&#10;&#9;&#9;y = pair.targets.height / 2;&#10;&#9;&#9;w = pair.targets.width / 2;&#10;&#9;&#9;h = 0;&#10;&#9;}&#10;&#10;&#9;enclose_prompt = &quot;Enclose the reflectance standard with box&quot;;&#10;&#9;box_image = straighten line;&#10;&#9;box &#10;&#9;&#9;= Region box_image x y w h, NULL == default&#10;&#9;&#9;= Region box_image default.box.left default.box.top &#10;&#9;&#9;&#9;default.box.width default.box.height &#10;&#9;{&#10;&#9;&#9;x = box_image.width / 4;&#10;&#9;&#9;y = box_image.height / 4;&#10;&#9;&#9;w = box_image.width / 2;&#10;&#9;&#9;h = box_image.height / 2;&#10;&#9;}&#10;&#10;&#9;rotate_prompt = &quot;Rotate the reflectance standard to get white at the bottom-left&quot;;&#10;&#9;rotate &#10;&#9;&#9;= rotate_widget 0 box, NULL == default&#10;&#9;&#9;= rotate_widget default.rotate.angle.value box;&#10;&#10;&#9;pacross = Expression (_ &quot;Patches across chart&quot;)&#10;&#9;&#9;&#9;(if NULL == default then 1 else to_real default.pacross); &#10;&#9;matrix = measure 0 0 rotate.width rotate.height &#10;&#9;&#9;&#9;(to_real pacross) 1 rotate;&#10;}" name="markup" caption="mark features on images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="22" name="A" caption="mark position of Macbeth in visible-light reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A21">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1">
              <Row name="pair">
                <Rhs vislevel="2" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="straighten_prompt">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="straighten_image">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="833" window_y="92" window_width="750" window_height="750" image_left="525" image_top="623" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="line">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="449" top="570" width="251" height="11">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="enclose_prompt">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box_image">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="833" window_y="92" window_width="750" window_height="750" image_left="744" image_top="659" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box">
                <Rhs vislevel="1" flags="1">
                  <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="479" top="621" width="243" height="167">
                    <iRegiongroup/>
                  </iRegion>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="rotate_prompt">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="rotate">
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
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="angle">
                      <Rhs vislevel="1" flags="1">
                        <Option caption="Rotate by" labelsn="4" labels0="Don't rotate" labels1="90 degrees clockwise" labels2="180 degrees" labels3="90 degrees anticlockwise" value="2"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Markup_macbeth linear.J13"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="555" y="0" open="true" selected="true" sform="false" next="5" name="B" caption="mark position of reflectance standards in visible-light reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1">
              <Row name="default">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="pair">
                <Rhs vislevel="2" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="straighten_prompt">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="straighten_image">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="833" window_y="92" window_width="750" window_height="750" image_left="1081" image_top="552" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="line">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="889" top="624" width="442" height="24">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="enclose_prompt">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box_image">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="833" window_y="92" window_width="750" window_height="750" image_left="1054" image_top="603" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box">
                <Rhs vislevel="1" flags="1">
                  <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="926" top="656" width="438" height="105">
                    <iRegiongroup/>
                  </iRegion>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="rotate_prompt">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="rotate">
                <Rhs vislevel="3" flags="7">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="1"/>
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
                        <iText formula="4"/>
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
              <Row name="matrix">
                <Rhs vislevel="1" flags="1">
                  <Matrix/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Markup_reflectance NULL linear.J13"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="1109" lpane_open="true" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;is_Pair = is_instanceof &quot;Pair&quot;;&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn targets x.targets) (op.fn object x.object),&#10;            is_Pair x],&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}&#10;&#10;apply = Tasks_capture_item.Apply_calib_item.action;&#10;&#10;export x = icc_export input.depth &quot;$VIPSHOME/share/$PACKAGE/data/sRGB.icm&quot; Render_intent.RELATIVE x; &#10;&#10;apply_xyz c x = colour_transform_to Image_type.XYZ (apply c x);&#10;&#10;Apply_calib c p = class &#10;&#9;Pair label targets object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = p.label;&#10;&#9;targets_label = p.targets_label ++ &quot;, colour-calibrated&quot;;&#10;&#9;targets = apply_xyz c p.targets;&#10;&#9;object_label = p.object_label ++ &quot;, colour-calibrated&quot;;&#10;&#9;object = apply_xyz c p.object;&#10;}&#10;&#10;&#9;" name="viscalib" caption="generate visible-light calibration from Macbeth" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="10" name="D" caption="generate calibration matrix">
      <Subcolumn vislevel="3">
        <Row popup="false" name="D1">
          <Rhs vislevel="2" flags="5">
            <Subcolumn vislevel="0"/>
            <iText formula="markup.A21.rotate"/>
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
            <iImage window_x="666" window_y="68" window_width="750" window_height="693" image_left="357" image_top="285" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action D8"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1276" y="0" open="true" selected="true" sform="false" next="36" name="C" caption="get reflectance standards from calibrated visible">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C35">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="markup.Markup_reflectance markup.B1 H10"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="667" y="0" open="true" selected="false" sform="false" next="11" name="H" caption="calibrate visible reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="H10">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Apply_calib D8 linear.J13"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}&#10;&#10;Apply_ct ct p = class &#10;&#9;Pair label targets object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = p.label;&#10;&#9;targets = p.targets / ct;&#10;&#9;object = p.object / ct; &#10;&#10;}" name="uvlcalib" caption="UV-induced visible luminescence calibration" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="1" name="A" caption="visible illuminant colour temperature">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
          <Rhs vislevel="1" flags="1">
            <Slider caption="macbeth illuminant colour temperature" from="1800" to="7000" value="5000"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Widget_slider_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A2">
          <Rhs vislevel="2" flags="5">
            <Colour/>
            <Subcolumn vislevel="0"/>
            <iText formula="colour_from_temp (to_real A1)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A3">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action A2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A4">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;target colour temperature -- nip2 neutral is D65&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A5">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_new_item.Widget_colour_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A6">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1">
              <Row name="dest">
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
                  <Colour/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="to">
                <Rhs vislevel="1" flags="1">
                  <Option caption="Convert to" labelsn="11" labels0="Mono" labels1="sRGB" labels2="RGB16" labels3="GREY16" labels4="Lab" labels5="LabQ" labels6="LabS" labels7="LCh" labels8="XYZ" labels9="Yxy" labels10="UCS" value="8"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_convert_item.XYZ_item.action A5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A7">
          <Rhs vislevel="1" flags="4">
            <iText formula="A2.value?0 / A6.value?1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A8">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calculated white-point adjustment to get to D65&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A9">
          <Rhs vislevel="2" flags="5">
            <Colour/>
            <Subcolumn vislevel="0"/>
            <iText formula="A7 * A6 / A3"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="511" y="0" open="true" selected="false" sform="false" next="7" name="B" caption="apply camera calibration and white-point adjustment">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B1">
          <Rhs vislevel="0" flags="4">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.D8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B2">
          <Rhs vislevel="1" flags="4">
            <Subcolumn vislevel="0"/>
            <iText formula="linear.J16"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B3">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.Apply_calib B1 B2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B6">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Apply_ct A9 B3"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Match a b = class &#10;&#9;_result {&#10;&#9;_vislevel = 3;&#10;&#10;&#9;reference = copy a;&#10;&#9;adjust = copy b;&#10;&#10;&#9;ap1 = Mark_relative reference 0.25 0.25;&#10;&#9;ap2 = Mark_relative reference 0.75 0.75;&#10;&#9;bp1 = Mark_relative adjust 0.25 0.25;&#10;&#9;bp2 = Mark_relative adjust 0.75 0.75;&#10;&#10;&#9;test_alignment = _result?1 ++ reference?1 ++ 0;&#10;&#10;&#9;_result&#10;&#9;&#9;= Image (im_match_linear reference.value adjust.value&#10;&#9;&#9;&#9;ap1.left ap1.top bp1.left bp1.top&#10;&#9;&#9;&#9;ap2.left ap2.top bp2.left bp2.top);&#10;}   &#10;&#10;Match_default default a b = class &#10;&#9;_result {&#10;&#9;_vislevel = 3;&#10;&#10;&#9;reference = copy a;&#10;&#9;adjust = copy b;&#10;&#10;&#9;ap1 = Mark reference default.ap1.left default.ap1.top;&#10;&#9;ap2 = Mark reference default.ap2.left default.ap2.top;&#10;&#9;bp1 = Mark adjust default.bp1.left default.bp1.top;&#10;&#9;bp2 = Mark adjust default.bp2.left default.bp2.top;&#10;&#10;&#9;test_alignment = _result?1 ++ reference?1 ++ 0;&#10;&#10;&#9;_result&#10;&#9;&#9;= Image (im_match_linear reference.value adjust.value&#10;&#9;&#9;&#9;ap1.left ap1.top bp1.left bp1.top&#10;&#9;&#9;&#9;ap2.left ap2.top bp2.left bp2.top);&#10;}&#10;&#10;" name="align" caption="align all images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="27" name="D" caption="match IR to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="D23">
          <Rhs vislevel="1" flags="4">
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.H10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D24">
          <Rhs vislevel="1" flags="4">
            <Subcolumn vislevel="0"/>
            <iText formula="linear.K8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D26">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="a">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="b">
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
              <Row name="reference">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="2" window_y="57" window_width="750" window_height="750" image_left="880" image_top="737" image_mag="8" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="2" window_y="57" window_width="750" window_height="750" image_left="1030" image_top="686" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="462" top="583" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="870" top="764" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="475" top="574" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="877" top="756" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="1060" image_top="550" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Match D23.targets D24.targets"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D1">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="a">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="b">
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
              <Row name="reference">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="878" window_y="89" window_width="750" window_height="750" image_left="211" image_top="200" image_mag="8" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="2" window_y="57" window_width="750" window_height="750" image_left="217" image_top="206" image_mag="16" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="211" top="200" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="1470" top="696" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="217" top="204" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="1463" top="695" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Match D23.object D24.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="450" y="0" open="true" selected="false" sform="false" next="10" name="E" caption="match UV to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="E7">
          <Rhs vislevel="1" flags="4">
            <Subcolumn vislevel="0"/>
            <iText formula="linear.K2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E8">
          <Rhs vislevel="3" flags="7">
            <iText formula="Match_default D26 D23.targets E7.targets"/>
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="default">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="a">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="b">
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
              <Row name="reference">
                <Rhs vislevel="1" flags="1">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="784" image_top="726" image_mag="4" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow>
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow>
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="448" top="571" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="848" top="755" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
          </Rhs>
        </Row>
        <Row popup="false" name="E9">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="default">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="a">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="b">
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
              <Row name="reference">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="1024" window_y="128" window_width="750" window_height="750" image_left="1438" image_top="691" image_mag="4" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="1438" image_top="697" image_mag="4" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow>
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow>
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="220" top="205" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="1464" top="694" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Match_default D1 D23.object E7.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="890" y="0" open="true" selected="false" sform="false" next="1" name="A" caption="match UV-induced visible luminescence to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
          <Rhs vislevel="1" flags="4">
            <Subcolumn vislevel="0"/>
            <iText formula="uvlcalib.B6"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A2">
          <Rhs vislevel="3" flags="7">
            <iText formula="Match_default D26 D23.targets A1.targets"/>
            <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="368" image_top="337" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="default">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="a">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="b">
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
              <Row name="reference">
                <Rhs vislevel="1" flags="1">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="813" window_y="132" window_width="750" window_height="750" image_left="411" image_top="493" image_mag="8" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow>
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow>
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="403" top="490" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="793" top="708" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="3" window_y="108" window_width="750" window_height="750" image_left="1034" image_top="673" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
          </Rhs>
        </Row>
        <Row popup="false" name="A3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="default">
                <Rhs vislevel="3" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="a">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="b">
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
              <Row name="reference">
                <Rhs vislevel="1" flags="1">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="1438" image_top="697" image_mag="4" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow>
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow>
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="210" top="203" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="1470" top="696" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Match_default D1 D23.object A1.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1332" y="0" open="true" selected="true" sform="false" next="1" name="B" caption="match vis-induced IR luminescence to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B1">
          <Rhs vislevel="1" flags="4">
            <Subcolumn vislevel="0"/>
            <iText formula="linear.K9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B2">
          <Rhs vislevel="3" flags="7">
            <iText formula="Match_default D26 D23.targets B1.targets"/>
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Match_default D1 D23.object B1.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;is_Pair = is_instanceof &quot;Pair&quot;;&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn targets x.targets) (op.fn object x.object),&#10;            is_Pair x],&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}&#10;&#10;Pair_new l x y = Pair l (to_image x.value) (to_image y.value);&#10;" name="specden" caption="spectral density" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="777" y="0" open="true" selected="false" sform="false" next="35" name="O" caption="match brightness of IR to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="O17">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.C35.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O16">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="B9.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O18">
          <Rhs vislevel="2" flags="5">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_transpose_item.action O17"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O19">
          <Rhs vislevel="2" flags="5">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_transpose_item.action O16"/>
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
          <Rhs vislevel="2" flags="5">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector [O20.slope, O21.slope, O22.slope]"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O24">
          <Rhs vislevel="2" flags="5">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector [O20.intercept, O21.intercept, O22.intercept]"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O34">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="B14 * O23 + O24"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1981" y="0" open="true" selected="false" sform="false" next="1" name="A" caption="match brightness of UV to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A7">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.C35.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A8">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="E2.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A9">
          <Rhs vislevel="1" flags="1">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_transpose_item.action A7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A10">
          <Rhs vislevel="1" flags="1">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_transpose_item.action A8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A11">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg A10.value?0 A9.value?0"/>
            <Subcolumn vislevel="1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A12">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg A10.value?1 A9.value?1"/>
            <Subcolumn vislevel="1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A13">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg A10.value?2 A9.value?2"/>
            <Subcolumn vislevel="1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A14">
          <Rhs vislevel="1" flags="1">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector [A11.slope, A12.slope, A13.slope]"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A15">
          <Rhs vislevel="1" flags="1">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector [A11.intercept, A12.intercept, A13.intercept]"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A16">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="E1 * A14 + A15"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="15" name="B" caption="get the spectralon from the IR reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B14">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair_new align.D24.label align.D26 align.D1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B9">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="markup.Markup_reflectance markup.B1 B14"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1213" y="0" open="true" selected="true" sform="false" next="1" name="E" caption="get the spectralon from the UV reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="E1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair_new align.E7.label align.E8 align.E9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="E2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="markup.Markup_reflectance markup.B1 E1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="698" lpane_open="true" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Pair_falsecolour a b = class {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;to_srgb x = colour_transform_to Image_type.sRGB x;&#10;&#9;comb type a b&#10;&#9;&#9;= b?1 ++ a?0 ++ a?1, type == 0&#10;&#9;&#9;= a?1 ++ a?2 ++ b?1;&#10;&#10;&#9;label = &quot;falsecolour from &quot; ++ b.label; &#10;&#9;combine = Option &quot;Combine bands as&quot; [&quot;X - RG&quot;, &quot;GB - X&quot;] 0;&#10;&#9;targets = comb combine.value (to_srgb a.targets) (to_srgb b.targets);&#10;&#9;object = comb combine.value (to_srgb a.object) (to_srgb b.object);&#10;&#10;}" name="falsecolour" caption="UV and IR falsecolour images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="true" sform="false" next="14" name="K" caption="make false colour images">
      <Subcolumn vislevel="3">
        <Row popup="false" name="K8">
          <Rhs vislevel="1" flags="4">
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.H10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="specden.O34"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K10">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="specden.A16"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K9">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair_falsecolour K8 K1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1">
              <Row name="a">
                <Rhs vislevel="2" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="b">
                <Rhs vislevel="2" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="label">
                <Rhs vislevel="1" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="combine">
                <Rhs vislevel="1" flags="1">
                  <Option caption="Combine bands as" labelsn="2" labels0="X - RG" labels1="GB - X" value="1"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="targets">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="1" window_y="52" window_width="750" window_height="750" image_left="636" image_top="682" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="object">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="1162" image_top="337" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Pair_falsecolour K8 K10"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;&#10;is_Pair = is_instanceof &quot;Pair&quot;;&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn targets x.targets) (op.fn object x.object),&#10;            is_Pair x],&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}&#10;&#10;Pair_new l x y = Pair l (to_image x.value) (to_image y.value);" name="uvlstray" caption="remove stray light from UV-induced visible luminescence image" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="777" y="0" open="true" selected="true" sform="false" next="48" name="Q" caption="remove residual visible light">
      <Subcolumn vislevel="3">
        <Row popup="false" name="Q1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="C32"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q13">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.H10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q29">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q30">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.C35.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q31">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="C33.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q38">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="Matrix_extract_item.Rows_item.action Q30"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q39">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="Matrix_extract_item.Rows_item.action Q31"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q44">
          <Rhs vislevel="1" flags="1">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector Q38.value?0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q2">
          <Rhs vislevel="2" flags="5">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector Q39.value?0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q45">
          <Rhs vislevel="1" flags="1">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="100 * Q2 / Q44"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q3">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="(Q45 / 100) * Q13"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q47">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair (Q1.label ++ &quot;, stray light removed&quot;) (Q1.targets - Q3.targets) (Q1.object - Q3.object)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="34" name="C" caption="get spectralon from UV-induced visible lum">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C32">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair_new align.A1.label align.A2 align.A3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C33">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="markup.Markup_reflectance markup.B1 C32"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="734" lpane_open="true" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;&#10;is_Pair = is_instanceof &quot;Pair&quot;;&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn targets x.targets) (op.fn object x.object),&#10;            is_Pair x],&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}" name="uvlkm" caption="Kubelka-Munk processing of UVL image" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="22" name="J" caption="kubelka munk">
      <Subcolumn vislevel="3">
        <Row popup="false" name="J1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.H10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="uvlstray.Q47"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J20">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="specden.A16"/>
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
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="J1 / J4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J13">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="(1 - J5) ** 2 / (2 * J5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J14">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="1 / (1 + (J13 / (J13 + 2)) ** 0.5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J15">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="J20 / J4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J18">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="(1 - J15) ** 2 / (2 * J15)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J19">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="1 / (1 + ( (J13 * (J13 + 2)) / (J18 * (J18 + 2)) ) ** 0.5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J17">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="0.5 * J2 / (J14 * J19)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="606" y="0" open="true" selected="true" sform="false" next="2" name="A" caption="result">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair (&quot;KM of &quot; ++ J2.label) J17.targets J17.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;&#10;is_Pair = is_instanceof &quot;Pair&quot;;&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn targets x.targets) (op.fn object x.object),&#10;            is_Pair x],&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}&#10;&#10;Pair_new l x y = Pair l (to_image x.value) (to_image y.value);" name="vilstray" caption="remove stray light from vis-induced IR luminescence image" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="777" y="0" open="true" selected="true" sform="false" next="48" name="Q" caption="remove residual visible light">
      <Subcolumn vislevel="3">
        <Row popup="false" name="Q1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="C32"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q13">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.H10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q29">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q30">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.C35.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q31">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="C33.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q38">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="Matrix_extract_item.Rows_item.action Q30"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q39">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="Matrix_extract_item.Rows_item.action Q31"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q44">
          <Rhs vislevel="1" flags="1">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector Q38.value?0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q2">
          <Rhs vislevel="2" flags="5">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="Vector Q39.value?0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q45">
          <Rhs vislevel="1" flags="1">
            <Vector/>
            <Subcolumn vislevel="0"/>
            <iText formula="100 * Q2 / Q44"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q3">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="(Q45 / 100) * Q13"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q47">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair (Q1.label ++ &quot;, stray light removed&quot;) (Q1.targets - Q3.targets) (Q1.object - Q3.object)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="34" name="C" caption="get spectralon from UV-induced visible lum">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C32">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair_new align.B1.label align.B2 align.B3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C33">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="markup.Markup_reflectance markup.B1 C32"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="662" lpane_open="true" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;&#10;is_Pair = is_instanceof &quot;Pair&quot;;&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn targets x.targets) (op.fn object x.object),&#10;            is_Pair x],&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}" name="vilkm" caption="Kubelka-Munk processing of visible-induced IR luminescence image" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="22" name="J" caption="kubelka munk">
      <Subcolumn vislevel="3">
        <Row popup="false" name="J1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.H10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="vilstray.Q47"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J20">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="specden.O34"/>
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
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="J1 / J4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J13">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="(1 - J5) ** 2 / (2 * J5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J14">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="1 / (1 + (J13 / (J13 + 2)) ** 0.5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J15">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="J20 / J4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J18">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="(1 - J15) ** 2 / (2 * J15)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J19">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="1 / (1 + ( (J13 * (J13 + 2)) / (J18 * (J18 + 2)) ) ** 0.5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J17">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="0.5 * J2 / (J14 * J19)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="606" y="0" open="true" selected="true" sform="false" next="6" name="I" caption="result">
      <Subcolumn vislevel="3">
        <Row popup="false" name="I1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair (&quot;KM of &quot; ++ J2.label) J17.targets J17.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="1" window_y="52" window_width="1918" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="false" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;export x&#10;&#9;= oo_unary_function export_op x, is_class x&#10;&#9;= icc_export input.depth &quot;$VIPSHOME/share/$PACKAGE/data/sRGB.icm&quot; Render_intent.RELATIVE (lab x), is_image x&#10;&#9;= error (_ &quot;bad arguments to &quot; ++ &quot;export&quot;)&#10;{&#10;&#9;export_op = Operator $export export Operator_type.COMPOUND false;&#10;&#10;&#9;lab x = colour_transform_to Image_type.LAB (get_image x);&#10;}&#10;&#10;" name="results" caption="all the finished images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="true" sform="false" next="8" name="A" caption="Macbeth image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A3">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (viscalib.H10)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A6">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibration data&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A2">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.D8"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="667" y="0" open="true" selected="false" sform="false" next="9" name="B" caption="False colour UV and IR images">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="falsecolour.K9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B4">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="falsecolour.K2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B5">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated UV and IR images&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B6">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (specden.O34)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B7">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (specden.A16)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1139" y="0" open="true" selected="false" sform="false" next="12" name="C" caption="luminescence iamges">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (uvlstray.Q47)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C9">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;stray visible light&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C11">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (uvlstray.Q3)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C4">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (uvlkm.A1)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C6">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (vilstray.Q47)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C8">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (vilkm.I1)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
</root>



