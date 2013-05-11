<?xml version="1.0"?>
<root xmlns="http://www.vips.ecs.soton.ac.uk/nip/7.33.0">
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="559" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;get_option options defaults f&#10;    = error (_ &quot;unknown parameter &quot; ++ f), hits == []&#10;    = hits?0&#10;{&#10;    hits = [v :: [n, v] &lt;- options ++ defaults; n == f];&#10;}&#10;&#10;mkim options x y b&#10;    = Image (image_new x y b&#10;        (opt $format) (opt $coding) (opt $type)&#10;        (opt $pixel)&#10;        (opt $xoffset) (opt $yoffset))&#10;{&#10;    opt = get_option options [&#10;        $format =&gt; Image_format.UCHAR,&#10;        $coding =&gt; Image_coding.NOCODING,&#10;        $type =&gt; Image_type.sRGB,&#10;        $pixel =&gt; 0,&#10;        $xoffset =&gt; 0,&#10;        $yoffset =&gt; 0&#10;    ];&#10;}&#10;&#10;Pair l a b = class &#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;};&#10;&#10;Pair_flatfield _i label = class&#10;    Pair label image flatfield {&#10;    _vislevel = 3;&#10;&#10;    image &#10;&#9;&#9;= mkim [] 10 10 3, NULL == _i&#10;&#9;&#9;= _i;&#10;    use_flatfield = Toggle (&quot;Flatfield &quot; ++ label ++ &quot; image&quot;) false;&#10;    flatfield = mkim [$pixel =&gt; 200] image.width image.height 3;&#10;}&#10;&#10;Pair_load label = class {&#10;&#9;_vislevel = 2;&#10;&#9;targets = Pair_flatfield NULL (label ++ &quot; with calibration targets&quot;);&#10;&#9;object = Pair_flatfield (targets.image) (label ++ &quot; of object&quot;);&#10;}&#10;" name="input" caption="all the source images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="681" y="0" open="true" selected="false" sform="false" next="3" name="E" caption="IR reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="E1">
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
                        <Subcolumn vislevel="0"/>
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
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_rg830.tif&quot;"/>
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
        <Row popup="false" name="F1">
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
                        <Subcolumn vislevel="0"/>
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
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/pozzo/pozzo23_dug11x.tif&quot;"/>
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
        <Row popup="false" name="G1">
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
                        <Subcolumn vislevel="0"/>
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
                        <Subcolumn vislevel="0"/>
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
    <Column x="2806" y="0" open="true" selected="false" sform="false" next="1" name="H" caption="visible-induced IR luminescence">
      <Subcolumn vislevel="3">
        <Row popup="false" name="H1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Pair_load &quot;visible-induced IR luminescence&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="11" name="A" caption="visible-light reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
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
                        <Subcolumn vislevel="0"/>
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
                        <Subcolumn vislevel="0"/>
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
    <Column x="0" y="587" open="true" selected="true" sform="false" next="5" name="I" caption="save output images as 16-bits?">
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
            <iText formula="A1.targets.image"/>
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
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;};&#10;&#10;&#10;// correct :: Pair_flatfield -&gt; Image&#10;correct pff&#10;&#9;= wc flat?1 im, pff.use_flatfield&#10;&#9;= im&#10;{&#10;&#9;import x&#10;&#9;&#9;= icc_import_embedded Render_intent.RELATIVE x, &#10;&#9;&#9;&#9;&#9;get_header_type &quot;icc-profile-data&quot; x != 0;&#10;&#9;&#9;= icc_import &quot;$VIPSHOME/share/$PACKAGE/data/sRGB.icm&quot; Render_intent.RELATIVE x;&#10;&#9;import_xyz = colour_transform_to Image_type.XYZ @ import;&#10;&#10;&#9;im = import_xyz pff.image;&#10;&#9;flat = import_xyz pff.flatfield;&#10;&#10;&#9;wc w i&#10;&#9;&#9;= clip2fmt i.format (w' * i)&#10;&#9;{&#10;&#9;&#9;fac = mean w / max w;&#10;&#9;&#9;w' = fac * (max w / w);&#10;&#9;}&#10;}&#10;&#10;// Correct_pair :: Pair_load -&gt; Pair &#10;Correct_pair pl = class &#10;&#9;Pair pl.label targets object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;targets_label = pl.targets.label;&#10;&#9;targets = correct pl.targets;&#10;&#9;object_label = pl.object.label;&#10;&#9;object = correct pl.object;&#10;}&#10;&#10;// Mono_pair :: Pair -&gt; Pair&#10;Mono_pair band p =&#9;class &#10;&#9;Pair p.label targets object { &#10;&#9;_vislevel = 2;&#10;&#10;&#9;_lab = Colour &quot;Lab&quot; [100, 0, 0];&#10;&#9;_xyz = colour_transform_to Image_type.XYZ _lab;&#10;&#9;mono x = _xyz * (x / _xyz) ? band;&#10;&#10;&#9;targets_label = p.targets_label ++ &quot;, just band &quot; ++ print band;&#10;&#9;targets = mono p.targets;&#10;&#9;object_label = p.object_label ++ &quot;, just band &quot; ++ print band;&#10;&#9;object = mono p.object;&#10;&#10;}" name="linear" caption="linearize and flatfield all images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="18" name="J" caption="import and flatfield">
      <Subcolumn vislevel="3">
        <Row popup="false" name="J2">
          <Rhs vislevel="2" flags="4">
            <iText formula="map Correct_pair [input.A1, input.E1, input.F1, input.G1, input.H1]"/>
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
    <Column x="583" y="0" open="true" selected="true" sform="false" next="10" name="K" caption="mono-ize IR and UV images">
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
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;};&#10;&#10;straighten arrow&#10;&#9;= rotate Interpolate_bilinear angle'' arrow.image&#10;{&#10;&#9;x = arrow.width;&#10;&#9;y = arrow.height;&#10;&#10;&#9;angle = im (polar (x, y));&#10;&#9;&#9;&#10;&#9;angle'&#10;&#9;&#9;= angle - 360, angle &gt; 315&#10;&#9;&#9;= angle - 180, angle &gt; 135&#10;&#9;&#9;= angle;&#10;&#9;&#9;&#10;&#9;angle''&#10;&#9;&#9;= -angle', angle' &gt;= (-45) &amp;&amp; angle' &lt; 45&#10;&#9;&#9;= 90 - angle';&#10;}&#10;&#10;rotate_widget = Image_transform_item.Rotate_item.Fixed_item.rotate_widget;&#10;&#10;Markup type default pair =&#10;&#9;class {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;straighten_prompt = &quot;Position line along edge of &quot; ++ type ++ &quot; in &quot; ++ pair.label;&#10;&#9;straighten_image = copy pair.targets;&#10;&#9;line &#10;&#9;&#9;= Arrow straighten_image x y w h, NULL == default&#10;&#9;&#9;= Arrow straighten_image default.line.left default.line.top &#10;&#9;&#9;&#9;default.line.width default.line.height&#10;&#9;{&#10;&#9;&#9;x = pair.targets.width / 4;&#10;&#9;&#9;y = pair.targets.height / 2;&#10;&#9;&#9;w = pair.targets.width / 2;&#10;&#9;&#9;h = 0;&#10;&#9;}&#10;&#10;&#9;enclose_prompt = &quot;Enclose the &quot; ++ type ++ &quot; with box&quot;;&#10;&#9;box_image = straighten line;&#10;&#9;box &#10;&#9;&#9;= Region box_image x y w h, NULL == default&#10;&#9;&#9;= Region box_image default.box.left default.box.top &#10;&#9;&#9;&#9;default.box.width default.box.height &#10;&#9;{&#10;&#9;&#9;x = box_image.width / 4;&#10;&#9;&#9;y = box_image.height / 4;&#10;&#9;&#9;w = box_image.width / 2;&#10;&#9;&#9;h = box_image.height / 2;&#10;&#9;}&#10;&#10;&#9;rotate_prompt = &quot;Rotate the &quot; ++ type ++ &quot; to get white at the bottom-left&quot;;&#10;&#9;rotate &#10;&#9;&#9;= rotate_widget 0 box, NULL == default&#10;&#9;&#9;= rotate_widget default.rotate.angle.value box;&#10;}&#10;&#10;&#10;&#10;&#9;" name="markup" caption="mark features on images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="21" name="A" caption="mark position of Macbeth in visible-light reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
          <Rhs vislevel="2" flags="6">
            <iText formula="Markup &quot;Macbeth&quot; NULL linear.J13"/>
            <Subcolumn vislevel="1">
              <Row name="type">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="441" image_top="461" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="line">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="450" top="568" width="252" height="13">
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="930" image_top="773" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box">
                <Rhs vislevel="1" flags="1">
                  <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="483" top="630" width="243" height="163">
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
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="578" y="0" open="true" selected="false" sform="false" next="8" name="C" caption="mark position of reflectance standards in IR reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C7">
          <Rhs vislevel="2" flags="6">
            <iText formula="Markup &quot;reflectance standard&quot; B1 linear.K8"/>
            <Subcolumn vislevel="1">
              <Row name="type">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="default">
                <Rhs vislevel="2" flags="4">
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="1161" image_top="710" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="line">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="904" top="610" width="499" height="28">
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="1061" image_top="662" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box">
                <Rhs vislevel="1" flags="1">
                  <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="929" top="644" width="447" height="112">
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
            </Subcolumn>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1092" y="0" open="true" selected="false" sform="false" next="1" name="E" caption="mark position of reflectance standards in UV reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="E1">
          <Rhs vislevel="2" flags="6">
            <iText formula="Markup &quot;reflectance standard&quot; B1 linear.K2"/>
            <Subcolumn vislevel="1">
              <Row name="type">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="default">
                <Rhs vislevel="2" flags="4">
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="1072" image_top="540" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="line">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="911" top="614" width="430" height="24">
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="1017" image_top="613" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box">
                <Rhs vislevel="1" flags="1">
                  <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="907" top="648" width="447" height="109">
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
            </Subcolumn>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1612" y="0" open="true" selected="false" sform="false" next="1" name="F" caption="mark position of reflectance standards in UV-induced visible luminescence image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="F1">
          <Rhs vislevel="2" flags="6">
            <iText formula="Markup &quot;reflectance standard&quot; B1 linear.J16"/>
            <Subcolumn vislevel="1">
              <Row name="type">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="default">
                <Rhs vislevel="2" flags="4">
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="842" image_top="607" image_mag="4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="line">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="830" top="587" width="534" height="58">
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="1085" image_top="628" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box">
                <Rhs vislevel="1" flags="1">
                  <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="883" top="646" width="447" height="112">
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
            </Subcolumn>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2249" y="0" open="true" selected="false" sform="false" next="1" name="G" caption="mark position of reflectance standards in visible-induced IR luminescence image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="G1">
          <Rhs vislevel="2" flags="6">
            <iText formula="Markup &quot;reflectance standard&quot; B1 linear.K9"/>
            <Subcolumn vislevel="1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="818" open="true" selected="false" sform="false" next="1" name="B" caption="mark position of reflectance standards in visible-light reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B1">
          <Rhs vislevel="2" flags="6">
            <iText formula="Markup &quot;reflectance standard&quot; NULL linear.J13"/>
            <Subcolumn vislevel="1">
              <Row name="type">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="998" image_top="641" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="line">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="893" top="622" width="414" height="17">
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
                  <iImage window_x="450" window_y="104" window_width="750" window_height="750" image_left="1109" image_top="642" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box">
                <Rhs vislevel="1" flags="1">
                  <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="916" top="648" width="447" height="112">
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
            </Subcolumn>
          </Rhs>
        </Row>
        <Row popup="false" name="B2">
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
            <iText formula="Colour_chart_to_matrix_item.action B1.rotate"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="400" rpane_open="false" local_defs="// private definitions for this works&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}&#10;&#10;apply = Tasks_capture_item.Apply_calib_item.action;&#10;&#10;export x = icc_export input.depth &quot;$VIPSHOME/share/$PACKAGE/data/sRGB.icm&quot; Render_intent.RELATIVE x; &#10;&#10;apply_xyz c x = colour_transform_to Image_type.XYZ (apply c x);&#10;&#10;Apply_calib c p = class &#10;&#9;Pair p.label targets object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;targets_label = p.targets_label ++ &quot;, colour-calibrated&quot;;&#10;&#9;targets = apply_xyz c p.targets;&#10;&#9;object_label = p.object_label ++ &quot;, colour-calibrated&quot;;&#10;&#9;object = apply_xyz c p.object;&#10;}&#10;&#10;&#9;" name="viscalib" caption="generate visible-light calibration from Macbeth" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="10" name="D" caption="generate calibration matrix">
      <Subcolumn vislevel="3">
        <Row popup="false" name="D1">
          <Rhs vislevel="2" flags="5">
            <Subcolumn vislevel="0"/>
            <iText formula="markup.A1.rotate"/>
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
    <Column x="865" y="0" open="true" selected="true" sform="false" next="34" name="C" caption="get reflectance standards from calibrated visible">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C33">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="markup.Markup &quot;reflectance standard&quot; markup.B1 H10"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="537" y="0" open="true" selected="false" sform="false" next="11" name="H" caption="calibrate visible reflectance image">
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
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="0" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}&#10;&#10;Apply_ct ct p = class &#10;&#9;Pair label targets object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = p.label;&#10;&#9;targets = p.targets / ct;&#10;&#9;object = p.object / ct; &#10;&#10;}" name="uvlcalib" caption="UV-induced visible luminescence calibration" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
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
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.D8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
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
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="588" lpane_open="true" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}&#10;&#10;Pair_before l r a = class&#10;&#9;Pair label reference adjust {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;reference = copy r;&#10;&#9;adjust = copy a;&#10;}&#10;&#10;Match default a b = class &#10;    _result {&#10;    _vislevel = 3;&#10;&#10;&#9; ap1 &#10;        = Mark_relative a 0.25 0.25, NULL == default&#10;        = Mark a default.ap1.left default.ap1.top;&#10;    ap2&#10;        = Mark_relative a 0.75 0.75, NULL == default&#10;        = Mark a default.ap2.left default.ap2.top;&#10;    bp1&#10;        = Mark_relative b 0.25 0.25, NULL == default&#10;        = Mark b default.ap1.left default.ap1.top;&#10;    bp2&#10;        = Mark_relative b 0.75 0.75, NULL == default&#10;        = Mark b default.bp2.left default.bp2.top;&#10;&#10;&#9;test_alignment = _result?1 ++ a?1 ++ 0;&#10;&#10;    _result&#10;        = Image (im_match_linear a.value b.value&#10;                ap1.left ap1.top bp1.left bp1.top&#10;                ap2.left ap2.top bp2.left bp2.top);&#10;}   &#10;&#10;// Pair_match :: Pair -&gt; Pair -&gt; Pair&#10;Pair_match a b = class&#10;&#9;Pair label targets object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = &quot;adjust &quot; ++ b.label ++ &quot; to match &quot; ++ a.label;&#10;&#9;targets_before = Pair_before &quot;targets before&quot; a.targets b.targets;&#10;&#9;targets = Match NULL targets_before.reference targets_before.adjust;&#10;&#9;object_before = Pair_before &quot;object before&quot; a.object b.object;&#10;&#9;object = Match NULL object_before.reference object_before.adjust;&#10;}&#10;&#10;" name="align" caption="align all images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="684" y="0" open="true" selected="false" sform="false" next="6" name="A" caption="transform IR reflectance to match visible">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="816" window_y="125" window_width="750" window_height="750" image_left="3817" image_top="236" image_mag="2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E29"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1316" window_y="161" window_width="750" window_height="750" image_left="3765" image_top="213" image_mag="16" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="linear.G13"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <iArrow left="3761" top="207" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="3753" top="209" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="206" top="2595" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="184" top="2605" width="0" height="0">
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
            <iText formula="Image_transform_item.Match_item.action A1 A2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A4">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;test alignment&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A5">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1574" window_y="87" window_width="750" window_height="750" image_left="3747" image_top="165" image_mag="2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="A3?1 ++ A1?1 ++ 0"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1056" y="0" open="true" selected="false" sform="false" next="1" name="B" caption="transform UV reflectance to match visible">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1110" window_y="149" window_width="750" window_height="750" image_left="325" image_top="1507" image_mag="4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E29"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="47" window_y="208" window_width="750" window_height="750" image_left="284" image_top="1508" image_mag="2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="linear.H5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <iArrow left="4053" top="296" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="4049" top="292" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="306" top="1513" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="282" top="1516" width="0" height="0">
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
            <iText formula="Image_transform_item.Match_item.action B1 B2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B4">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;test alignment&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B5">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1687" window_y="159" window_width="750" window_height="750" image_left="1070" image_top="2255" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="(B3?1 * 2) ++ B1?1 ++ 0"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1434" y="0" open="true" selected="false" sform="false" next="7" name="T" caption="align UV-induced vis luminescence to visible">
      <Subcolumn vislevel="3">
        <Row popup="false" name="T1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="134" window_y="163" window_width="750" window_height="750" image_left="4140" image_top="614" image_mag="4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E29"/>
          </Rhs>
        </Row>
        <Row popup="false" name="T2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="938" window_y="349" window_width="750" window_height="750" image_left="4140" image_top="630" image_mag="4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="uvlcalib.R6"/>
          </Rhs>
        </Row>
        <Row popup="false" name="T3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <iArrow left="4184" top="624" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="4174" top="625" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="436" top="2360" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="424" top="2363" width="0" height="0">
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
        <Row popup="false" name="T4">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;test alignment&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="T5">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1583" window_y="137" window_width="750" window_height="750" image_left="3872" image_top="640" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="T3?1 ++ T1?1 ++ 0"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1821" y="0" open="true" selected="false" sform="false" next="1" name="C" caption="align vis-induced IR luminescence to visible">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="134" window_y="163" window_width="750" window_height="750" image_left="4140" image_top="614" image_mag="4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E29"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="938" window_y="349" window_width="750" window_height="750" image_left="4140" image_top="630" image_mag="4" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="linear.I5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <iArrow left="4184" top="624" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="4174" top="625" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="436" top="2360" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="424" top="2363" width="0" height="0">
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
            <iText formula="Image_transform_item.Match_item.action C1 C2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C4">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;test alignment&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C5">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1583" window_y="137" window_width="750" window_height="750" image_left="3872" image_top="640" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C3?1 ++ C1?1 ++ 0"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="20" name="D">
      <Subcolumn vislevel="3">
        <Row popup="false" name="D6">
          <Rhs vislevel="1" flags="4">
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.H10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D2">
          <Rhs vislevel="1" flags="4">
            <Subcolumn vislevel="0"/>
            <iText formula="linear.K8"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="244" y="0" open="true" selected="true" sform="false" next="7" name="F">
      <Subcolumn vislevel="3">
        <Row popup="false" name="F1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="copy viscalib.H10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="copy linear.K8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F3">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1">
              <Row name="default">
                <Rhs vislevel="0" flags="4">
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
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="280" top="447" width="0" height="0">
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
                  <iArrow left="76" top="123" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow>
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
            <iText formula="Match NULL F1.targets F2.targets"/>
          </Rhs>
        </Row>
        <Row popup="false" name="F6">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="1"/>
            <iText formula="Match F3 F1.object F2.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="100" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;" name="specden" caption="spectral density" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="327" y="0" open="true" selected="false" sform="false" next="28" name="O" caption="match brightness of IR to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="O17">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.C11"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O16">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0">
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
            <iText formula="C11"/>
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
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O21">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg O19.value?1 O18.value?1"/>
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O22">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg O19.value?2 O18.value?2"/>
            <Subcolumn vislevel="0"/>
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
            <iText formula="C1 * O23 + O24"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="951" y="0" open="true" selected="true" sform="false" next="1" name="A" caption="match brightness of UV to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A7">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.C11"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A8">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="D11"/>
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
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A12">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg A10.value?1 A9.value?1"/>
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A13">
          <Rhs vislevel="2" flags="6">
            <iText formula="linreg A10.value?2 A9.value?2"/>
            <Subcolumn vislevel="0"/>
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
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="669" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="D1 * A14 + A15"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="32" name="C" caption="get spectralon from IR reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="776" window_y="193" window_width="750" window_height="750" image_left="2208" image_top="1914" image_mag="-6" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="align.A3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="2" flags="5">
            <iArrow>
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C3">
          <Rhs vislevel="2" flags="5">
            <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true">
              <iRegiongroup/>
            </iRegion>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C4">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O14"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C5">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O28"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C6">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C7">
          <Rhs vislevel="2" flags="5">
            <iArrow>
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_new_item.Image_region_item.Move_item.action C1 C2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C8">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_transform_item.Rotate_item.Straighten_item.action C7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C9">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1" window_y="52" window_width="482" window_height="750" image_left="234" image_top="1004" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                        <iText formula="C3.left"/>
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
                        <iText formula="C3.top"/>
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
                        <iText formula="C3.width"/>
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
                        <iText formula="C3.height"/>
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
            <iText formula="Image_crop_item.action C8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C10">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <iText formula="C4.angle"/>
                  <Option/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_transform_item.Rotate_item.Fixed_item.Rot90_item.action C9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C11">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0">
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
                        <iText formula="C5.pacross.expr "/>
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
                        <iText formula="C5.pdown.expr "/>
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
            <iText formula="Colour_chart_to_matrix_item.action C10"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="616" y="0" open="true" selected="false" sform="false" next="1" name="D" caption="get spectralon from UV reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="D1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="1369" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="align.B3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D2">
          <Rhs vislevel="2" flags="5">
            <iArrow>
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D3">
          <Rhs vislevel="2" flags="5">
            <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true">
              <iRegiongroup/>
            </iRegion>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D4">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O14"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D5">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O28"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D6">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D7">
          <Rhs vislevel="2" flags="5">
            <iArrow>
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_new_item.Image_region_item.Move_item.action D1 D2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D8">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_transform_item.Rotate_item.Straighten_item.action D7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D9">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1" window_y="52" window_width="482" window_height="750" image_left="234" image_top="1004" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                        <iText formula="D3.left"/>
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
                        <iText formula="D3.top"/>
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
                        <iText formula="D3.width"/>
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
                        <iText formula="D3.height"/>
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
            <iText formula="Image_crop_item.action D8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D10">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <iText formula="D4.angle"/>
                  <Option/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_transform_item.Rotate_item.Fixed_item.Rot90_item.action D9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D11">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0">
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
                        <iText formula="D5.pacross.expr "/>
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
                        <iText formula="D5.pdown.expr "/>
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
            <iText formula="Colour_chart_to_matrix_item.action D10"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="100" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;" name="falsecolour" caption="UV and IR falsecolour images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="7" name="K" caption="make IR falsecolour">
      <Subcolumn vislevel="3">
        <Row popup="false" name="K1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="52" window_width="750" window_height="750" image_left="2208" image_top="1914" image_mag="-6" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="specden.O25"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Visible is a 16-bit image?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K3">
          <Rhs vislevel="1" flags="4">
            <iText formula="viscalib.E25"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1" window_y="55" window_width="750" window_height="750" image_left="736" image_top="1438" image_mag="-2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <Option/>
                  <Subcolumn vislevel="0"/>
                  <iText formula="Option (_ &quot;Output depth&quot;) [_ &quot;8 bit&quot;, _ &quot;16 bit&quot;] (if K3 then 1 else 0)"/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_icc_item.Export_item.action K1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K8">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="2" window_y="27" window_width="750" window_height="1024" image_left="1130" image_top="1686" image_mag="-2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E28"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K10">
          <Rhs vislevel="1" flags="1">
            <iText formula="Option &quot;Combine bands as&quot; [&quot;X - RG&quot;, &quot;GB - X&quot;] 0"/>
            <Option caption="Combine bands as" labelsn="2" labels0="X - RG" labels1="GB - X" value="0"/>
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="K11">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1152" window_y="27" window_width="750" window_height="1024" image_left="1840" image_top="2280" image_mag="-5" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="[K4?0 ++ K8?0 ++ K8?1, K8?1 ++ K8?2 ++ K4?2]?K10"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="347" y="0" open="true" selected="false" sform="false" next="1" name="B" caption="make UV falsecolour">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="52" window_width="750" window_height="750" image_left="2208" image_top="1914" image_mag="-6" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="specden.A16"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Visible is a 16-bit image?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B3">
          <Rhs vislevel="1" flags="4">
            <iText formula="viscalib.E25"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1" window_y="55" window_width="750" window_height="750" image_left="736" image_top="1438" image_mag="-2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <Option/>
                  <Subcolumn vislevel="0"/>
                  <iText formula="Option (_ &quot;Output depth&quot;) [_ &quot;8 bit&quot;, _ &quot;16 bit&quot;] (if B3 then 1 else 0)"/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Colour_icc_item.Export_item.action B1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B5">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="2" window_y="27" window_width="750" window_height="1024" image_left="1130" image_top="1686" image_mag="-2" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E28"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B6">
          <Rhs vislevel="1" flags="1">
            <iText formula="Option &quot;Combine bands as&quot; [&quot;X - RG&quot;, &quot;GB - X&quot;] 0"/>
            <Option caption="Combine bands as" labelsn="2" labels0="X - RG" labels1="GB - X" value="1"/>
            <Subcolumn vislevel="0"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B7">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1152" window_y="27" window_width="750" window_height="1024" image_left="1840" image_top="2280" image_mag="-5" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="[B4?0 ++ B5?0 ++ B5?1, B5?1 ++ B5?2 ++ B4?2]?B6"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="426" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;&#10;" name="uvlstray" caption="remove stray light from UV-induced visible luminescence image" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="386" y="0" open="true" selected="true" sform="false" next="47" name="Q" caption="remove residual visible light">
      <Subcolumn vislevel="3">
        <Row popup="false" name="Q1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="4" window_y="22" window_width="750" window_height="750" image_left="368" image_top="1220" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q13">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="52" window_width="750" window_height="750" image_left="736" image_top="1490" image_mag="-2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E29"/>
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
            <iText formula="viscalib.C11"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q31">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="C11"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q38">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_extract_item.Rows_item.action Q30"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q39">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0"/>
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
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="(Q45 / 100) * Q13"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q4">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="57" window_width="750" window_height="750" image_left="2078" image_top="2282" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Q1 - Q3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q46">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Colour_convert_item.sRGB_item.action Q3"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="386" y="904" open="true" selected="false" sform="false" next="6" name="W" caption="back to RGB">
      <Subcolumn vislevel="3">
        <Row popup="false" name="W1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="368" image_top="1337" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Q4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Source image is 16-bit?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W3">
          <Rhs vislevel="1" flags="4">
            <iText formula="viscalib.E25"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="528" window_y="27" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <Option/>
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
            <Subcolumn vislevel="0"/>
            <iText formula="Colour_convert_item.sRGB_item.action W4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="32" name="C" caption="get spectralon from UV-induced visible lum">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="1369" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="align.T3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="2" flags="5">
            <iArrow>
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C3">
          <Rhs vislevel="2" flags="5">
            <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true">
              <iRegiongroup/>
            </iRegion>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C4">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O14"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C5">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O28"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C6">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C7">
          <Rhs vislevel="2" flags="5">
            <iArrow>
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_new_item.Image_region_item.Move_item.action C1 C2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C8">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_transform_item.Rotate_item.Straighten_item.action C7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C9">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1" window_y="52" window_width="482" window_height="750" image_left="234" image_top="1004" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                        <iText formula="C3.left"/>
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
                        <iText formula="C3.top"/>
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
                        <iText formula="C3.width"/>
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
                        <iText formula="C3.height"/>
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
            <iText formula="Image_crop_item.action C8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C10">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="669" window_y="157" window_width="750" window_height="363" image_left="357" image_top="120" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <iText formula="C4.angle"/>
                  <Option/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_transform_item.Rotate_item.Fixed_item.Rot90_item.action C9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C11">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0">
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
                        <iText formula="C5.pacross.expr "/>
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
                        <iText formula="C5.pdown.expr "/>
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
            <iText formula="Colour_chart_to_matrix_item.action C10"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="426" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;&#10;" name="uvlkm" caption="Kubelka-Munk processing of UVL image" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="22" name="J" caption="kubelka munk">
      <Subcolumn vislevel="3">
        <Row popup="false" name="J1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="368" image_top="669" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E29"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="173" window_y="141" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="uvlstray.Q4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J20">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
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
        <Row popup="false" name="J14">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="27.295051938857174" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="1 / (1 + (J13 / (J13 + 2)) ** 0.5)"/>
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
        <Row popup="false" name="J19">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="11.952023241406405" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="1 / (1 + ( (J13 * (J13 + 2)) / (J18 * (J18 + 2)) ) ** 0.5)"/>
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
    <Column x="202" y="0" open="true" selected="false" sform="false" next="6" name="I" caption="back to RGB">
      <Subcolumn vislevel="3">
        <Row popup="false" name="I1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="24" window_width="750" window_height="750" image_left="2208" image_top="2022" image_mag="-6" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="J17"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Source image is 16-bit?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I3">
          <Rhs vislevel="1" flags="4">
            <iText formula="viscalib.E25"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="528" window_y="27" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <Option/>
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
            <Subcolumn vislevel="0"/>
            <iText formula="Colour_convert_item.sRGB_item.action I1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="426" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;&#10;" name="vilstray" caption="remove stray light from visible-induced IR luminescence image" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="354" y="0" open="true" selected="false" sform="false" next="46" name="Q" caption="remove residual visible light">
      <Subcolumn vislevel="3">
        <Row popup="false" name="Q1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="4" window_y="22" window_width="750" window_height="750" image_left="368" image_top="1220" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="C1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q13">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="52" window_width="750" window_height="750" image_left="736" image_top="1490" image_mag="-2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E29"/>
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
            <iText formula="viscalib.C11"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q31">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="C11"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q38">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_extract_item.Rows_item.action Q30"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q39">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0"/>
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
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="(Q45 / 100) * Q13"/>
          </Rhs>
        </Row>
        <Row popup="false" name="Q4">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="57" window_width="750" window_height="750" image_left="2078" image_top="2282" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Q1 - Q3"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="354" y="765" open="true" selected="false" sform="false" next="6" name="W" caption="back to RGB">
      <Subcolumn vislevel="3">
        <Row popup="false" name="W1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="368" image_top="1337" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Q4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Source image is 16-bit?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W3">
          <Rhs vislevel="1" flags="4">
            <iText formula="viscalib.E25"/>
          </Rhs>
        </Row>
        <Row popup="false" name="W4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="528" window_y="27" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <Option/>
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
            <Subcolumn vislevel="0"/>
            <iText formula="Colour_convert_item.sRGB_item.action W4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="true" sform="false" next="32" name="C" caption="get spectralon from vis-induced IR lum">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="29" window_width="750" window_height="750" image_left="368" image_top="1369" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="align.C3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="2" flags="5">
            <iArrow>
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C3">
          <Rhs vislevel="2" flags="5">
            <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true">
              <iRegiongroup/>
            </iRegion>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C4">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O14"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C5">
          <Rhs vislevel="0" flags="4">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="markup.O28"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C6">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C7">
          <Rhs vislevel="2" flags="5">
            <iArrow>
              <iRegiongroup/>
            </iArrow>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_new_item.Image_region_item.Move_item.action C1 C2"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C8">
          <Rhs vislevel="3" flags="7">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Image_transform_item.Rotate_item.Straighten_item.action C7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C9">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="1" window_y="52" window_width="482" window_height="750" image_left="234" image_top="1004" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                        <iText formula="C3.left"/>
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
                        <iText formula="C3.top"/>
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
                        <iText formula="C3.width"/>
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
                        <iText formula="C3.height"/>
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
            <iText formula="Image_crop_item.action C8"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C10">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="669" window_y="157" window_width="750" window_height="363" image_left="357" image_top="120" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <iText formula="C4.angle"/>
                  <Option/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Image_transform_item.Rotate_item.Fixed_item.Rot90_item.action C9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C11">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="0">
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
                        <iText formula="C5.pacross.expr "/>
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
                        <iText formula="C5.pdown.expr "/>
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
            <iText formula="Colour_chart_to_matrix_item.action C10"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="426" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;&#10;" name="vilkm" caption="Kubelka-Munk processing of visible-induced IR luminescence image" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="22" name="J" caption="kubelka munk">
      <Subcolumn vislevel="3">
        <Row popup="false" name="J1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="368" image_top="669" image_mag="1" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E29"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J2">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="173" window_y="141" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="vilstray.Q4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="J20">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="specden.O25"/>
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
        <Row popup="false" name="J14">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="27.295051938857174" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="1 / (1 + (J13 / (J13 + 2)) ** 0.5)"/>
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
        <Row popup="false" name="J19">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="1" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="11.952023241406405" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="1 / (1 + ( (J13 * (J13 + 2)) / (J18 * (J18 + 2)) ) ** 0.5)"/>
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
    <Column x="202" y="0" open="true" selected="false" sform="false" next="6" name="I" caption="back to RGB">
      <Subcolumn vislevel="3">
        <Row popup="false" name="I1">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="0" window_y="24" window_width="750" window_height="750" image_left="2208" image_top="2022" image_mag="-6" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="J17"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I2">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;Source image is 16-bit?&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I3">
          <Rhs vislevel="1" flags="4">
            <iText formula="viscalib.E25"/>
          </Rhs>
        </Row>
        <Row popup="false" name="I4">
          <Rhs vislevel="3" flags="7">
            <iImage window_x="528" window_y="27" window_width="750" window_height="750" image_left="2576" image_top="2233" image_mag="-7" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0">
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
                  <Option/>
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
            <Subcolumn vislevel="0"/>
            <iText formula="Colour_convert_item.sRGB_item.action I1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="29" window_width="1920" window_height="1051" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" lpane_position="400" lpane_open="false" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;" name="results" caption="all the finished images" filename="$HOME/GIT/bm-workspaces/bm-workspaces2.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="7" name="A" caption="Macbeth image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A5">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated visible reflectance&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A3">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="viscalib.E28"/>
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
    <Column x="202" y="0" open="true" selected="false" sform="false" next="9" name="B" caption="False colour UV and IR images">
      <Subcolumn vislevel="3">
        <Row popup="false" name="B1">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;false-colour IR image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B2">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="falsecolour.K11"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B3">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated IR reflectance image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B4">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="falsecolour.K4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B5">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;false-colour UV image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B6">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="falsecolour.B7"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B8">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated UV reflectance image&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="B7">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="falsecolour.B4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="498" y="0" open="true" selected="true" sform="false" next="12" name="C" caption="luminescence iamges">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C1">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated UV-induced visible luminescence&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="uvlstray.W4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C9">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;stray visible light&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C11">
          <Rhs vislevel="2" flags="5">
            <iImage window_x="1" window_y="29" window_width="750" window_height="750" image_left="368" image_top="337" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="uvlstray.Q46"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C3">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;after Kubelka-Munk processing&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C4">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="uvlkm.I4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C5">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;calibrated vis-induced IR luminescence&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C6">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="vilstray.W4"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C7">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot;after Kubelka-Munk processing&quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C8">
          <Rhs vislevel="2" flags="5">
            <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
            <Subcolumn vislevel="0"/>
            <iText formula="vilkm.I4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
</root>


