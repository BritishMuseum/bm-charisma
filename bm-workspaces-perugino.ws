<?xml version="1.0"?>
<root xmlns="http://www.vips.ecs.soton.ac.uk/nip/8.3.0">
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="790" lpane_open="false" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;get_option options defaults f&#10;    = error (_ &quot;unknown parameter &quot; ++ f), hits == []&#10;    = hits?0&#10;{&#10;    hits = [v :: [n, v] &lt;- options ++ defaults; n == f];&#10;}&#10;&#10;mkim options x y b&#10;    = Image (image_new x y b&#10;        (opt $format) (opt $coding) (opt $type)&#10;        (opt $pixel)&#10;        (opt $xoffset) (opt $yoffset))&#10;{&#10;    opt = get_option options [&#10;        $format =&gt; Image_format.UCHAR,&#10;        $coding =&gt; Image_coding.NOCODING,&#10;        $type =&gt; Image_type.sRGB,&#10;        $pixel =&gt; 0,&#10;        $xoffset =&gt; 0,&#10;        $yoffset =&gt; 0&#10;    ];&#10;}&#10;&#10;is_Pair = is_instanceof &quot;Pair&quot;;&#10;&#10;Pair l a b = class&#10;    _Object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = l;&#10;&#9;targets = a;&#10;&#9;object = b;&#10;&#9;&#10;    oo_binary_table op x = [&#10;        [this.Pair label (op.fn targets x.targets) (op.fn object x.object),&#10;            is_Pair x],&#10;        [this.Pair label (op.fn a x) (op.fn b x),&#10;            true]&#10;    ];&#10;&#9;oo_unary_table op = [&#10;&#9;&#9;[this.Pair label (op.fn a) (op.fn b),&#10;&#9;&#9;&#9;true]&#10;&#9;];&#10;}&#10;&#10;Pair_new l x y = Pair l (to_image x.value) (to_image y.value);&#10;&#10;Pair_flatfield _i label = class {&#10;    _vislevel = 3;&#10;&#10;    image &#10;&#9;&#9;= mkim [] 100 100 3, NULL == _i&#10;&#9;&#9;= _i;&#10;    use_flatfield = Toggle (&quot;Flatfield &quot; ++ label ++ &quot; image&quot;) false;&#10;    flatfield = mkim [$pixel =&gt; 200] image.width image.height 3;&#10;}&#10;&#10;Pair_load label = class {&#10;&#9;_vislevel = 2;&#10;&#9;targets = Pair_flatfield NULL (label ++ &quot; with calibration targets&quot;);&#10;&#9;object = Pair_flatfield (targets.image) (label ++ &quot; of object&quot;);&#10;}&#10;&#10;draw_samples im across down measure&#10;    = mark&#10;{&#10;    patch_width = im.width / across;&#10;    sample_width = patch_width * (measure / 100);&#10;    left_margin = (patch_width - sample_width) / 2;&#10;    patch_height = im.height / down;&#10;    sample_height = patch_height * (measure / 100);&#10;    top_margin = (patch_height - sample_height) / 2;&#10;&#10;    cods = [[x * patch_width + left_margin, y * patch_height + top_margin] ::  &#10;        y &lt;- [0 .. down - 1]; x &lt;- [0 .. across - 1]];&#10;    x = map (extract 0) cods;&#10;    y = map (extract 1) cods;&#10;&#10;    outer = mkim [$pixel =&gt; 255] sample_width sample_height 1;&#10;    inner = mkim [] (sample_width - 4) (sample_height - 4) 1;&#10;    patch = insert 2 2 inner outer;&#10;&#10;    bg = mkim [] im.width im.height 1;&#10;&#10;    mask = Image (im_insertset bg.value patch.value x y);&#10;&#10;    im' = colour_transform_to Image_type.sRGB im;&#10;&#10;    mark = if mask then Vector [0, 255, 0] else im';&#10;}&#10;&#10;measure_samples im across down measure&#10;    = measures&#10;{&#10;    patch_width = im.width / across;&#10;    sample_width = patch_width * (measure / 100);&#10;    left_margin = (patch_width - sample_width) / 2;&#10;    patch_height = im.height / down;&#10;    sample_height = patch_height * (measure / 100);&#10;    top_margin = (patch_height - sample_height) / 2;&#10;                &#10;    cods = [[x * patch_width + left_margin, y * patch_height + top_margin] ::&#10;        y &lt;- [0 .. down - 1]; x &lt;- [0 .. across - 1]];&#10;        &#10;    patches = map (\p extract_area p?0 p?1 sample_width sample_height im) cods;&#10;    measures = Matrix (map (map mean) (map bandsplit patches));&#10;}&#10;&#10;Colour_chart_to_matrix_item = class&#10;    Menuaction (_ &quot;_Measure Colour Chart&quot;)&#10;        (_ &quot;measure average pixel values for a colour chart image&quot;) {&#10;    action x = class&#10;        _result {&#10;        _vislevel = 3;&#10;&#10;        pacross = Expression (_ &quot;Patches across chart&quot;) 6;&#10;        pdown = Expression (_ &quot;Patches down chart&quot;) 4;&#10;        measure = Scale (_ &quot;Average centre (%)&quot;) 1 100 50;&#10;&#10;        // get a representative image from an arg&#10;        get_image x&#10;            = get_image x.value?0, is_Group x&#10;            = x;&#10;        _im = get_image x; &#10;&#10;        // and display it with a visualisation of the sample patches&#10;        sample = draw_samples _im&#10;            (to_real pacross) (to_real pdown) (to_real measure);&#10;&#10;        _result&#10;            = map_unary chart x&#10;        {&#10;            chart in&#10;                = measure_samples in&#10;                    (to_real pacross) (to_real pdown) (to_real measure);&#10;        }&#10;    }&#10;}&#10;&#10;Find_calib_item = class &#10;&#9;Menuaction &quot;Find _Colour Calibration&quot; &#10;&#9;&#9;&quot;find an RGB -&gt; XYZ transform from an image of a colour chart&quot; {&#10;&#9;action image = class&#10;&#9;&#9;_result {&#10;&#9;&#9;_check_args = [&#10;&#9;&#9;&#9;[image, &quot;image&quot;, check_Image]&#10;&#9;&#9;];&#10;&#9;&#9;_vislevel = 3;&#10;&#10;&#9;&#9;measure = Scale (_ &quot;Measure area (%)&quot;) 1 100 50; &#10;&#10;&#9;&#9;sample = draw_samples image 6 4 (to_real measure);&#10;&#10;&#9;&#9;// get macbeth data file to use&#10;&#9;&#9;macbeth = Pathname &quot;Pick a Macbeth data file&quot; &#10;&#9;&#9;&#9;&quot;$VIPSHOME/share/$PACKAGE/data/macbeth_lab_d65.mat&quot;;&#10;&#10;&#9;&#9;mode = Option &quot;Input LUT&quot; [&#10;&#9;&#9;&#9;&quot;Linearize from chart greyscale&quot;,&#10;&#9;&#9;&#9;&quot;Fit intercept from chart greyscale&quot;,&#10;&#9;&#9;&#9;&quot;Linear input, set brightness from chart&quot;,&#10;&#9;&#9;&#9;&quot;Linear input&quot;&#10;&#9;&#9;] 0;&#10;&#10;&#9;&#9;// get max of input image&#10;&#9;&#9;_max_value = Image_format.maxval image.format;&#10;&#10;&#9;&#9;// measure chart image&#10;&#9;&#9;_camera = measure_samples image 6 4 (to_real measure);&#10;&#10;&#9;&#9;// load true values&#10;&#9;&#9;_true_Lab = Matrix_file macbeth.value;&#10;&#9;&#9;_true_XYZ = colour_transform &#10;&#9;&#9;&#9;Image_type.LAB Image_type.XYZ _true_Lab;&#10;&#10;&#9;&#9;// get Ys of greyscale&#10;&#9;&#9;_true_grey_Y = map (extract 1) (drop 18 _true_XYZ.value);&#10;&#10;&#9;&#9;// camera greyscale (all bands)&#10;&#9;&#9;_camera_grey = drop 18 _camera.value;&#10;&#10;&#9;&#9;// normalise both to 0-1 and combine&#10;&#9;&#9;_camera_grey' = map (map (multiply (1 / _max_value))) _camera_grey;&#10;&#9;&#9;_true_grey_Y' = map (multiply (1 / 100)) _true_grey_Y;&#10;&#9;&#9;_comb &#10;&#9;&#9;&#9;= Matrix (map2 cons _true_grey_Y' _camera_grey'), mode == 0&#10;&#9;&#9;&#9;= Matrix [0: intercepts, replicate (_camera.width + 1) 1], &#10;&#9;&#9;&#9;&#9;mode == 1&#10;&#9;&#9;&#9;= Matrix [[0, 0], [1, 1]]&#10;&#9;&#9;{&#10;&#9;&#9;&#9;intercepts = [(linreg _true_grey_Y' cam).intercept :: &#10;&#9;&#9;&#9;&#9;cam &lt;- transpose _camera_grey'];&#10;&#9;&#9;}&#10;&#10;&#9;&#9;// make a linearising lut ... zero on left&#10;&#9;&#9;_linear_lut = im_invertlut _comb (_max_value + 1);&#10;&#10;&#9;&#9;// and display it&#10;&#9;&#9;// plot from 0 explicitly so we see the effect of mode1 (intercept&#10;&#9;&#9;// from greyscale)&#10;&#9;&#9;linearising_lut = Plot [$ymin =&gt; 0] _linear_lut;&#10;&#10;&#9;&#9;// map an image though the lineariser&#10;&#9;&#9;linear x&#10;&#9;&#9;&#9;= hist_map linearising_lut.value x, mode == 0 || mode == 1&#10;&#9;&#9;&#9;= x;&#10;&#10;&#9;&#9;// map the chart measurements though the lineariser&#10;&#9;&#9;_camera' = (to_matrix @ linear @ to_image) _camera;&#10;&#10;&#9;&#9;// solve for RGB -&gt; XYZ&#10;&#9;&#9;// normalise: the 2nd row is what makes Y, so divide by that to&#10;&#9;&#9;// get Y in 0-1.&#10;&#9;&#9;_pinv = (transpose _camera' * _camera') ** -1;&#10;&#9;&#9;_full_M = transpose (_pinv * (transpose _camera' * _true_XYZ));&#10;&#9;&#9;M = _full_M / scale;&#10;&#9;&#9;scale = sum _full_M.value?1;&#10;&#10;&#9;&#9;// now turn the camera to LAB and calculate dE76&#10;&#9;&#9;_camera'' = (to_matrix @ &#10;&#9;&#9;&#9;colour_transform Image_type.XYZ Image_type.LAB @ &#10;&#9;&#9;&#9;recomb M @ &#10;&#9;&#9;&#9;multiply scale @&#10;&#9;&#9;&#9;to_image) _camera';&#10;&#10;&#9;&#9;_dEs = map abs_vec (_camera'' - _true_Lab).value;&#10;&#9;&#9;avg_dE76 = mean _dEs;&#10;&#9;&#9;_max_dE = foldr max_pair 0 _dEs;&#10;&#9;&#9;_worst = index (equal _max_dE) _dEs;&#10;&#9;&#9;worst_patch &#10;&#9;&#9;&#9;= name _worst ++ &quot; (patch &quot; ++ &#10;&#9;&#9;&#9;&#9;print (_worst + 1) ++ &quot;, &quot; ++ &#10;&#9;&#9;&#9;&#9;print _max_dE ++ &quot; dE)&quot;&#10;&#9;&#9;{&#10;&#9;&#9;&#9;name i &#10;&#9;&#9;&#9;&#9;= macbeth_names?i, i &gt;= 0 &amp;&amp; i &lt; len macbeth_names&#10;&#9;&#9;&#9;&#9;= &quot;Unknown&quot;;&#10;&#9;&#9;}&#10;&#10;&#9;&#9;// normalise brightness ... in linear mode, we optionally don't&#10;&#9;&#9;// set the brightness from the Macbeth chart&#10;&#9;&#9;norm x &#10;&#9;&#9;&#9;= x * scale, mode != 3&#10;&#9;&#9;&#9;= x;&#10;&#10;&#9;&#9;// convert RGB camera to Lab&#10;&#9;&#9;_result = (Image @&#10;&#9;&#9;&#9;colour_transform Image_type.XYZ Image_type.LAB @&#10;&#9;&#9;&#9;norm @&#10;&#9;&#9;&#9;recomb M @&#10;&#9;&#9;&#9;cast_float @&#10;&#9;&#9;&#9;linear) image.value;&#10;&#9;}&#10;}&#10;&#10;Apply_calib_item = class &#10;&#9;Menuaction &quot;_Apply Colour Calibration&quot; &#10;&#9;&#9;&quot;apply an RGB -&gt; LAB transform to an image&quot; {&#10;&#9;action a b = class&#10;&#9;&#9;(map_binary process a b) {&#10;&#9;&#9;process a b&#10;&#9;&#9;&#9;= result, is_instanceof calib_name calib&#10;&#9;&#9;&#9;= error (_ &quot;bad arguments to &quot; ++ &quot;Calibrate_image&quot;)&#10;&#9;&#9;{&#10;&#9;&#9;&#9;// the name of the calib object we need&#10;&#9;&#9;&#9;calib_name = &quot;Find_calib_item.action&quot;;&#10;&#10;&#9;&#9;&#9;// get the Calibrate_chart arg first&#10;&#9;&#9;&#9;[image, calib] = sortc (const (is_instanceof calib_name)) &#10;&#9;&#9;&#9;&#9;[a, b];&#10;&#10;&#9;&#9;&#9;result = (Image @&#10;&#9;&#9;&#9;&#9;colour_transform Image_type.XYZ Image_type.LAB @&#10;&#9;&#9;&#9;&#9;calib.norm @&#10;&#9;&#9;&#9;&#9;recomb calib.M @&#10;&#9;&#9;&#9;&#9;cast_float @&#10;&#9;&#9;&#9;&#9;calib.linear) image.value;&#10;&#9;&#9;}&#10;&#9;}&#10;}&#10;&#10;&#10;&#10;" name="input" caption="all the source images" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
    <Column x="729" y="0" open="true" selected="false" sform="false" next="3" name="E" caption="IR reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="E2">
          <Rhs vislevel="4" flags="6">
            <Subcolumn vislevel="3">
              <Row name="label">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
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
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_rg830_1.TIF&quot;"/>
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
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_wbir_1.TIF&quot;"/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="object">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Pair_load &quot;IR reflectance&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="729" y="654" open="true" selected="false" sform="false" next="1" name="F" caption="UV reflectance">
      <Subcolumn vislevel="3">
        <Row popup="false" name="F2">
          <Rhs vislevel="4" flags="6">
            <Subcolumn vislevel="3">
              <Row name="label">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
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
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_dug11_1-full.TIF&quot;"/>
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
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_wbuv_1.TIF&quot;"/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="object">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Pair_load &quot;UV reflectance&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1494" y="0" open="true" selected="false" sform="false" next="3" name="G" caption="UV-induced visible luminescence">
      <Subcolumn vislevel="3">
        <Row popup="false" name="G2">
          <Rhs vislevel="4" flags="6">
            <Subcolumn vislevel="3">
              <Row name="label">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
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
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_kv418+idas_1.TIF&quot;"/>
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
                  <Subcolumn vislevel="2"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Pair_load &quot;UV-induced visible luminescence&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1494" y="654" open="true" selected="true" sform="false" next="1" name="H" caption="visible-induced IR luminescence">
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
          <Rhs vislevel="3" flags="6">
            <Subcolumn vislevel="2">
              <Row name="label">
                <Rhs vislevel="0" flags="4">
                  <iText/>
                </Rhs>
              </Row>
              <Row name="super">
                <Rhs vislevel="0" flags="4">
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
                      <Rhs vislevel="0" flags="4">
                        <iText/>
                      </Rhs>
                    </Row>
                    <Row name="image">
                      <Rhs vislevel="1" flags="1">
                        <iImage image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true"/>
                        <Subcolumn vislevel="0"/>
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_idas_1.TIF&quot;"/>
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
                        <iText formula="Image_file &quot;$HOME/GIT/bm-workspaces/images/perugino_headman_wb_1.TIF&quot;"/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="object">
                <Rhs vislevel="3" flags="6">
                  <Subcolumn vislevel="2"/>
                  <iText/>
                </Rhs>
              </Row>
            </Subcolumn>
            <iText formula="Pair_load &quot;visible reflectance&quot;"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="654" open="true" selected="false" sform="false" next="5" name="I" caption="save output images as 16-bits?">
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
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="660" lpane_open="false" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;// correct :: Pair_flatfield -&gt; Image&#10;correct pff&#10;&#9;= wc flat?1 im, pff.use_flatfield&#10;&#9;= im&#10;{&#10;&#9;import x&#10;&#9;&#9;= icc_import_embedded Render_intent.RELATIVE x, &#10;&#9;&#9;&#9;&#9;get_header_type &quot;icc-profile-data&quot; x != 0;&#10;&#9;&#9;= icc_import &quot;$VIPSHOME/share/$PACKAGE/data/sRGB.icm&quot; Render_intent.RELATIVE x;&#10;&#9;import_xyz = colour_transform_to Image_type.XYZ @ import;&#10;&#10;&#9;im = import_xyz pff.image;&#10;&#9;flat = import_xyz pff.flatfield;&#10;&#10;&#9;wc w i&#10;&#9;&#9;= clip2fmt i.format (w' * i)&#10;&#9;{&#10;&#9;&#9;fac = mean w / max w;&#10;&#9;&#9;w' = fac * (max w / w);&#10;&#9;}&#10;}&#10;&#10;// Correct_pair :: Pair_load -&gt; Pair &#10;Correct_pair pl = class {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = pl.label;&#10;&#9;targets_label = pl.targets.label;&#10;&#9;targets = correct pl.targets;&#10;&#9;object_label = pl.object.label;&#10;&#9;object = correct pl.object;&#10;}&#10;&#10;// Mono_pair :: Pair -&gt; Pair&#10;Mono_pair band p =&#9;class { &#10;&#9;_vislevel = 2;&#10;&#10;&#9;_lab = Colour &quot;Lab&quot; [100, 0, 0];&#10;&#9;_xyz = colour_transform_to Image_type.XYZ _lab;&#10;&#9;mono x = _xyz * (x / _xyz) ? band;&#10;&#10;&#9;label = p.label;&#10;&#9;targets_label = p.targets_label ++ &quot;, just band &quot; ++ print band;&#10;&#9;targets = mono p.targets;&#10;&#9;object_label = p.object_label ++ &quot;, just band &quot; ++ print band;&#10;&#9;object = mono p.object;&#10;&#10;}" name="linear" caption="linearize and flatfield all images" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
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
    <Column x="217" y="0" open="true" selected="true" sform="false" next="10" name="K" caption="mono-ize IR and UV images">
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
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="1011" lpane_open="false" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;straighten arrow&#10;&#9;= rotate Interpolate_bilinear angle'' arrow.image&#10;{&#10;&#9;x = arrow.width;&#10;&#9;y = arrow.height;&#10;&#10;&#9;angle = im (polar (x, y));&#10;&#9;&#9;&#10;&#9;angle'&#10;&#9;&#9;= angle - 360, angle &gt; 315&#10;&#9;&#9;= angle - 180, angle &gt; 135&#10;&#9;&#9;= angle;&#10;&#9;&#9;&#10;&#9;angle''&#10;&#9;&#9;= -angle', angle' &gt;= (-45) &amp;&amp; angle' &lt; 45&#10;&#9;&#9;= 90 - angle';&#10;}&#10;&#10;rotate_widget = Image_transform_item.Rotate_item.Fixed_item.rotate_widget;&#10;&#10;Markup_macbeth pair = class {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;straighten_prompt = &quot;Position line along edge of Macbeth in &quot; ++ pair.label;&#10;&#9;straighten_image = copy pair.targets;&#10;&#9;line &#10;&#9;&#9;= Arrow straighten_image x y w h&#10;&#9;{&#10;&#9;&#9;x = pair.targets.width / 4;&#10;&#9;&#9;y = pair.targets.height / 2;&#10;&#9;&#9;w = pair.targets.width / 2;&#10;&#9;&#9;h = 0;&#10;&#9;}&#10;&#10;&#9;enclose_prompt = &quot;Enclose the Macbeth with box&quot;;&#10;&#9;box_image = straighten line;&#10;&#9;box &#10;&#9;&#9;= Region box_image x y w h &#10;&#9;{&#10;&#9;&#9;x = box_image.width / 4;&#10;&#9;&#9;y = box_image.height / 4;&#10;&#9;&#9;w = box_image.width / 2;&#10;&#9;&#9;h = box_image.height / 2;&#10;&#9;}&#10;&#10;&#9;rotate_prompt = &quot;Rotate the Macbeth to get white at the bottom-left&quot;;&#10;&#9;rotate &#10;&#9;&#9;= rotate_widget 0 box;&#10;}&#10;&#10;Markup_reflectance default pair =&#9;class {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;straighten_prompt = &quot;Position line along edge of reflectance standard in &quot; ++ pair.label;&#10;&#9;straighten_image = copy pair.targets;&#10;&#9;line &#10;&#9;&#9;= Arrow straighten_image x y w h, NULL == default&#10;&#9;&#9;= Arrow straighten_image default.line.left default.line.top &#10;&#9;&#9;&#9;default.line.width default.line.height&#10;&#9;{&#10;&#9;&#9;x = pair.targets.width / 4;&#10;&#9;&#9;y = pair.targets.height / 2;&#10;&#9;&#9;w = pair.targets.width / 2;&#10;&#9;&#9;h = 0;&#10;&#9;}&#10;&#10;&#9;enclose_prompt = &quot;Enclose the reflectance standard with box&quot;;&#10;&#9;box_image = straighten line;&#10;&#9;box &#10;&#9;&#9;= Region box_image x y w h, NULL == default&#10;&#9;&#9;= Region box_image default.box.left default.box.top &#10;&#9;&#9;&#9;default.box.width default.box.height &#10;&#9;{&#10;&#9;&#9;x = box_image.width / 4;&#10;&#9;&#9;y = box_image.height / 4;&#10;&#9;&#9;w = box_image.width / 2;&#10;&#9;&#9;h = box_image.height / 2;&#10;&#9;}&#10;&#10;&#9;rotate_prompt = &quot;Rotate the reflectance standard to get white at the bottom-left&quot;;&#10;&#9;rotate &#10;&#9;&#9;= rotate_widget 0 box, NULL == default&#10;&#9;&#9;= rotate_widget default.rotate.angle.value box;&#10;&#10;&#9;pacross = Expression (_ &quot;Patches across chart&quot;)&#10;&#9;&#9;&#9;(if NULL == default then 1 else to_real default.pacross); &#10;&#9;centre = Scale (_ &quot;Take centre (%)&quot;) 1 100 &#10;&#9;&#9;&#9;(if NULL == default then 50 else to_real default.centre);&#10;&#10;&#9;sample = input.draw_samples rotate (to_real pacross) 1 (to_real centre);&#10;&#9;matrix = input.measure_samples rotate (to_real pacross) 1 (to_real centre);&#10;}" name="markup" caption="mark features on images" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
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
                  <iText formula="&quot;Put line along edge of Macbeth&quot;"/>
                </Rhs>
              </Row>
              <Row name="straighten_image">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="598" window_y="0" window_width="913" window_height="1049" image_left="1106" image_top="1662" image_mag="-2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="line">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="262" top="1576" width="6" height="944">
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
                  <iImage window_x="0" window_y="0" window_width="1366" window_height="706" image_left="1340" image_top="2120" image_mag="-2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box">
                <Rhs vislevel="1" flags="1">
                  <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="252" top="1570" width="664" height="980">
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
                        <Option caption="Rotate by" labelsn="4" labels0="Don't rotate" labels1="90 degrees clockwise" labels2="180 degrees" labels3="90 degrees anticlockwise" value="1"/>
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
    <Column x="541" y="0" open="true" selected="false" sform="false" next="5" name="B" caption="mark position of reflectance standards in visible-light reflectance image">
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
                  <iImage window_x="0" window_y="0" window_width="750" window_height="746" image_left="420" image_top="1454" image_mag="2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="line">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="294" top="171" width="12" height="1354">
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
                  <iImage window_x="0" window_y="0" window_width="750" window_height="746" image_left="724" image_top="676" image_mag="-2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="box">
                <Rhs vislevel="1" flags="1">
                  <iRegion image_left="0" image_top="0" image_mag="0" show_status="false" show_paintbox="false" show_convert="false" show_rulers="false" scale="0" offset="0" falsecolour="false" type="true" left="320" top="170" width="326" height="1344">
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
                        <Option caption="Rotate by" labelsn="4" labels0="Don't rotate" labels1="90 degrees clockwise" labels2="180 degrees" labels3="90 degrees anticlockwise" value="1"/>
                        <Subcolumn vislevel="0"/>
                        <iText/>
                      </Rhs>
                    </Row>
                  </Subcolumn>
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
              <Row name="centre">
                <Rhs vislevel="1" flags="1">
                  <Slider/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="sample">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="175" window_y="175" window_width="480" window_height="340" image_left="227" image_top="133" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
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
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="408" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;apply = input.Apply_calib_item.action;&#10;&#10;export x = icc_export input.depth &quot;$VIPSHOME/share/$PACKAGE/data/sRGB.icm&quot; Render_intent.RELATIVE x; &#10;&#10;apply_xyz c x = colour_transform_to Image_type.XYZ (apply c x);&#10;&#10;Apply_calib c p = class &#10;&#9;input.Pair label targets object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = p.label;&#10;&#9;targets_label = p.targets_label ++ &quot;, colour-calibrated&quot;;&#10;&#9;targets = apply_xyz c p.targets;&#10;&#9;object_label = p.object_label ++ &quot;, colour-calibrated&quot;;&#10;&#9;object = apply_xyz c p.object;&#10;}&#10;&#10;&#9;" name="viscalib" caption="generate visible-light calibration from Macbeth" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
    <Column x="0" y="0" open="true" selected="true" sform="false" next="15" name="D" caption="generate calibration matrix">
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
              <Row name="measure">
                <Rhs vislevel="1" flags="1">
                  <Slider caption="Measure area (%)" from="1" to="100" value="50"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="sample">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="25" window_y="25" window_width="1367" window_height="904" image_left="677" image_top="415" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
            <iText formula="input.Find_calib_item.action D1"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="890" y="0" open="true" selected="false" sform="false" next="36" name="C" caption="get reflectance standards from calibrated visible">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C35">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="markup.Markup_reflectance markup.B1 H10"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="572" y="0" open="true" selected="false" sform="false" next="11" name="H" caption="calibrate visible reflectance image">
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
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="0" lpane_open="false" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Apply_ct ct p = class &#10;&#9;input.Pair label targets object {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;label = p.label;&#10;&#9;targets = p.targets / ct;&#10;&#9;object = p.object / ct; &#10;}" name="uvlcalib" caption="UV-induced visible luminescence calibration" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
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
    <Column x="502" y="0" open="true" selected="false" sform="false" next="7" name="B" caption="apply camera calibration and white-point adjustment">
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
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="0" lpane_open="false" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Match a b = class &#10;&#9;_result {&#10;&#9;_vislevel = 3;&#10;&#10;&#9;reference = copy a;&#10;&#9;adjust = copy b;&#10;&#10;&#9;ap1 = Mark_relative reference 0.25 0.25;&#10;&#9;ap2 = Mark_relative reference 0.75 0.75;&#10;&#9;bp1 = Mark_relative adjust 0.25 0.25;&#10;&#9;bp2 = Mark_relative adjust 0.75 0.75;&#10;&#10;&#9;test_alignment = _result?1 ++ reference?1 ++ 0;&#10;&#10;&#9;_result&#10;&#9;&#9;= Image (im_match_linear reference.value adjust.value&#10;&#9;&#9;&#9;ap1.left ap1.top bp1.left bp1.top&#10;&#9;&#9;&#9;ap2.left ap2.top bp2.left bp2.top);&#10;}   &#10;&#10;Match_default default a b = class &#10;&#9;_result {&#10;&#9;_vislevel = 3;&#10;&#10;&#9;reference = copy a;&#10;&#9;adjust = copy b;&#10;&#10;&#9;ap1 = Mark reference default.ap1.left default.ap1.top;&#10;&#9;ap2 = Mark reference default.ap2.left default.ap2.top;&#10;&#9;bp1 = Mark adjust default.bp1.left default.bp1.top;&#10;&#9;bp2 = Mark adjust default.bp2.left default.bp2.top;&#10;&#10;&#9;test_alignment = _result?1 ++ reference?1 ++ 0;&#10;&#10;&#9;_result&#10;&#9;&#9;= Image (im_match_linear reference.value adjust.value&#10;&#9;&#9;&#9;ap1.left ap1.top bp1.left bp1.top&#10;&#9;&#9;&#9;ap2.left ap2.top bp2.left bp2.top);&#10;}&#10;&#10;" name="align" caption="align all images" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
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
                  <iImage window_x="73" window_y="83" window_width="750" window_height="746" image_left="4048" image_top="321" image_mag="2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="861" window_y="69" window_width="760" window_height="659" image_left="4046" image_top="344" image_mag="2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="207" top="2593" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="4077" top="340" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="186" top="2604" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="4070" top="342" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="1" window_y="0" window_width="750" window_height="746" image_left="354" image_top="1536" image_mag="2" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
                  <iImage window_x="798" window_y="3" window_width="750" window_height="750" image_left="2208" image_top="2022" image_mag="-6" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="34" window_y="25" window_width="750" window_height="750" image_left="2208" image_top="1914" image_mag="-6" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="3.5826800357899482" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="190" top="2032" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="ap2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="1909" top="815" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp1">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="184" top="2040" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="1917" top="812" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="1168" window_y="455" window_width="750" window_height="750" image_left="2208" image_top="1914" image_mag="-6" show_status="true" show_paintbox="false" show_convert="true" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
    <Column x="459" y="0" open="true" selected="false" sform="false" next="10" name="E" caption="match UV to vis">
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
                  <iImage window_x="116" window_y="232" window_width="750" window_height="750" image_left="3867" image_top="332" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="907" window_y="102" window_width="750" window_height="750" image_left="4077" image_top="339" image_mag="4" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
                  <iArrow left="184" top="2600" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="4073" top="337" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="37" window_y="37" window_width="750" window_height="750" image_left="362" image_top="2488" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
            <Subcolumn vislevel="1"/>
            <iText formula="Match_default D1 D23.object E7.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="907" y="0" open="true" selected="false" sform="false" next="1" name="A" caption="match UV-induced visible luminescence to vis">
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
                  <iImage window_x="37" window_y="37" window_width="750" window_height="750" image_left="362" image_top="2488" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="adjust">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="680" window_y="165" window_width="750" window_height="750" image_left="198" image_top="2600" image_mag="8" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
                  <iArrow left="195" top="2595" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="bp2">
                <Rhs vislevel="1" flags="1">
                  <iArrow left="4067" top="341" width="0" height="0">
                    <iRegiongroup/>
                  </iArrow>
                  <Subcolumn vislevel="0"/>
                  <iText/>
                </Rhs>
              </Row>
              <Row name="test_alignment">
                <Rhs vislevel="1" flags="1">
                  <iImage window_x="37" window_y="37" window_width="750" window_height="750" image_left="362" image_top="2488" image_mag="1" show_status="true" show_paintbox="false" show_convert="false" show_rulers="false" scale="1" offset="0" falsecolour="false" type="true"/>
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
            <Subcolumn vislevel="1"/>
            <iText formula="Match_default D1 D23.object A1.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="1356" y="0" open="true" selected="true" sform="false" next="1" name="B" caption="match vis-induced IR luminescence to vis">
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
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="0" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;" name="specden" caption="spectral density" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
    <Column x="1137" y="0" open="true" selected="false" sform="false" next="35" name="O" caption="match brightness of IR to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="O17">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="C9"/>
          </Rhs>
        </Row>
        <Row popup="false" name="O16">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="C4"/>
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
    <Column x="2831" y="0" open="true" selected="false" sform="false" next="1" name="A" caption="match brightness of UV to vis">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A7">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="D6"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A8">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="D7"/>
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
            <iText formula="input.Pair_new align.D24.label align.D26 align.D1"/>
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
    <Column x="1704" y="0" open="true" selected="false" sform="false" next="1" name="E" caption="get the spectralon from the UV reflectance image">
      <Subcolumn vislevel="3">
        <Row popup="false" name="E1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="input.Pair_new align.E7.label align.E8 align.E9"/>
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
    <Column x="780" y="0" open="true" selected="false" sform="false" next="10" name="C" caption="add a 0 if we only have one spectralon">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C1">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.C35.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="B9.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C3">
          <Rhs vislevel="2" flags="5">
            <Matrix valuen="3" value0="0" value1="0" value2="0" width="3" height="1" scale="1" offset="0" filename="" display="0"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_build_item.Plain_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C7">
          <Rhs vislevel="1" flags="1">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_join.Top_bottom_item.action C1 C3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C8">
          <Rhs vislevel="1" flags="1">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_join.Top_bottom_item.action C2 C3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C9">
          <Rhs vislevel="2" flags="5">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="if to_real B9.pacross == 1 then C7 else C1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C4">
          <Rhs vislevel="2" flags="5">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="if to_real B9.pacross == 1 then C8 else C2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="2474" y="0" open="true" selected="true" sform="false" next="1" name="D" caption="add a 0 if we only have one spectralon">
      <Subcolumn vislevel="3">
        <Row popup="false" name="D1">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.C35.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D2">
          <Rhs vislevel="3" flags="7">
            <Matrix/>
            <Subcolumn vislevel="1"/>
            <iText formula="E2.matrix"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D3">
          <Rhs vislevel="2" flags="5">
            <Matrix valuen="3" value0="0" value1="0" value2="0" width="3" height="1" scale="1" offset="0" filename="" display="0"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_build_item.Plain_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D4">
          <Rhs vislevel="1" flags="1">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_join.Top_bottom_item.action D1 D3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D5">
          <Rhs vislevel="1" flags="1">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="Matrix_join.Top_bottom_item.action D2 D3"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D6">
          <Rhs vislevel="2" flags="5">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="if to_real B9.pacross == 1 then D4 else D1"/>
          </Rhs>
        </Row>
        <Row popup="false" name="D7">
          <Rhs vislevel="2" flags="5">
            <Matrix/>
            <Subcolumn vislevel="0"/>
            <iText formula="if to_real B9.pacross == 1 then D5 else D2"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="0" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;Pair_falsecolour a b = class {&#10;&#9;_vislevel = 2;&#10;&#10;&#9;to_srgb x = colour_transform_to Image_type.sRGB x;&#10;&#9;comb type a b&#10;&#9;&#9;= b?1 ++ a?0 ++ a?1, type == 0&#10;&#9;&#9;= a?1 ++ a?2 ++ b?1;&#10;&#10;&#9;label = &quot;falsecolour from &quot; ++ b.label; &#10;&#9;combine = Option &quot;Combine bands as&quot; [&quot;X - RG&quot;, &quot;GB - X&quot;] 0;&#10;&#9;targets = comb combine.value (to_srgb a.targets) (to_srgb b.targets);&#10;&#9;object = comb combine.value (to_srgb a.object) (to_srgb b.object);&#10;&#10;}" name="falsecolour" caption="UV and IR falsecolour images" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
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
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="0" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;" name="uvlstray" caption="remove stray light from UV-induced visible luminescence image" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
    <Column x="781" y="0" open="true" selected="false" sform="false" next="48" name="Q" caption="remove residual visible light">
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
            <iText formula="input.Pair (Q1.label ++ &quot;, stray light removed&quot;) (Q1.targets - Q3.targets) (Q1.object - Q3.object)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="34" name="C" caption="get spectralon from UV-induced visible lum">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C32">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="input.Pair_new align.A1.label align.A2 align.A3"/>
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
    <Column x="1497" y="0" open="true" selected="true" sform="false" next="6" name="A" caption="UVL exposure compensation">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="Q47"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A4">
          <Rhs vislevel="1" flags="1">
            <Slider caption="Scale" from="0.10000000000000001" to="5" value="1"/>
            <Subcolumn vislevel="0"/>
            <iText formula="Widget_slider_item.action"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A5">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="A1 * A4"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="0" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;/* Make a colour from a temperature.&#10; */     &#10;colour_from_temp T  &#10;    = error (_ &quot;T out of range&quot;), T &lt; 1667 || T &gt; 25000&#10;    = Colour &quot;Yxy&quot; [50, x, y]&#10;{       &#10;    // Kim et all approximation&#10;    // see eg. http://en.wikipedia.org/wiki/Planckian_locus#Approximation&#10;    x&#10;        = -0.2661239 * 10 ** 9 / T ** 3 - 0.2343580 * 10 ** 6 / T ** 2 +&#10;            0.8776956 * 10 ** 3 / T + 0.179910, T &lt; 4000&#10;        = -3.0258469 * 10 ** 9 / T ** 3 + 2.1070379 * 10 ** 6 / T ** 2 +&#10;            0.2226347 * 10 ** 3 / T + 0.240390;&#10; &#10;    y &#10;        = -1.1063814 * x ** 3 - 1.34811020 * x ** 2 +&#10;            2.18555832 * x - 0.20219638, T &lt; 2222&#10;        = -0.9549476 * x ** 3 - 1.37418593 * x ** 2 +&#10;            2.09137015 * x - 0.16748867, T &lt; 4000&#10;        =  3.0817580 * x ** 3 - 5.87338670 * x ** 2 +&#10;            3.75112997 * x - 0.37001483;&#10;}&#10;&#10;temp_from_colour z&#10;    = T&#10;{&#10;    c = colour_transform_to Image_type.YXY (to_colour z);&#10;    x = c.value?1;&#10;    y = c.value?2;&#10;        &#10;    // McCamy's approximation, see eg. &#10;    // http://en.wikipedia.org/wiki/Color_temperature#Approximation&#10;&#10;    xe = 0.332;&#10;    ye = 0.1858;&#10;    n = (x - xe) / (y - ye);&#10;    T = -449 * n ** 3 + 3525 * n ** 2 - 6823.3 * n + 5520.33;&#10;}   &#10;" name="uvlkm" caption="Kubelka-Munk processing of UVL image" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
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
            <iText formula="uvlstray.A5"/>
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
    <Column x="376" y="0" open="true" selected="true" sform="false" next="2" name="A" caption="result">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="input.Pair (&quot;KM of &quot; ++ J2.label) J17.targets J17.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="0" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;" name="vilstray" caption="remove stray light from vis-induced IR luminescence image" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
    <Column x="378" y="0" open="true" selected="true" sform="false" next="48" name="Q" caption="remove residual visible light">
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
            <iText formula="specden.O34"/>
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
            <iText formula="input.Pair (Q1.label ++ &quot;, stray light removed&quot;) (Q1.targets - Q3.targets) (Q1.object - Q3.object)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="34" name="C" caption="get spectralon from UV-induced visible lum">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C32">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="input.Pair_new align.B1.label align.B2 align.B3"/>
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
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="0" lpane_open="false" rpane_position="400" rpane_open="false" local_defs="// private definitions for this workspace&#10;" name="vilkm" caption="Kubelka-Munk processing of visible-induced IR luminescence image" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
    <Column x="379" y="0" open="true" selected="true" sform="false" next="6" name="I" caption="result">
      <Subcolumn vislevel="3">
        <Row popup="false" name="I1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="input.Pair (&quot;KM of &quot; ++ A2.label) A13.targets A13.object"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
    <Column x="0" y="0" open="true" selected="false" sform="false" next="22" name="A" caption="kubelka munk">
      <Subcolumn vislevel="3">
        <Row popup="false" name="A1">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="viscalib.H10"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="vilstray.Q47"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A3">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="specden.O34"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A4">
          <Rhs vislevel="1" flags="4">
            <iText formula="&quot; &quot;"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A5">
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
        <Row popup="false" name="A6">
          <Rhs vislevel="3" flags="7">
            <Colour/>
            <Subcolumn vislevel="1"/>
            <iText formula="Colour_convert_item.XYZ_item.action A5"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A7">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="A1 / A6"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A8">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="(1 - A7) ** 2 / (2 * A7)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A9">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="A3 / A6"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A10">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="(1 - A9) ** 2 / (2 * A9)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A11">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="1 / (1 + (A10 / (A10 + 2)) ** 0.5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A12">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="1 / (1 + ( (A10 * (A10 + 2)) / (A8 * (A8 + 2)) ) ** 0.5)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="A13">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="0.5 * A2 / (A11 * A12)"/>
          </Rhs>
        </Row>
      </Subcolumn>
    </Column>
  </Workspace>
  <Workspace window_x="0" window_y="37" window_width="1920" window_height="1043" view="WORKSPACE_MODE_REGULAR" scale="1" offset="0" locked="false" lpane_position="0" lpane_open="false" rpane_position="100" rpane_open="false" local_defs="// private definitions for this workspace&#10;&#10;export x&#10;&#9;= oo_unary_function export_op x, is_class x&#10;&#9;= icc_export input.depth &quot;$VIPSHOME/share/$PACKAGE/data/sRGB.icm&quot; Render_intent.RELATIVE (lab x), is_image x&#10;&#9;= error (_ &quot;bad arguments to &quot; ++ &quot;export&quot;)&#10;{&#10;&#9;export_op = Operator $export export Operator_type.COMPOUND false;&#10;&#10;&#9;lab x = colour_transform_to Image_type.LAB (get_image x);&#10;}&#10;&#10;" name="results" caption="all the finished images" filename="$HOME/GIT/bm-workspaces/bm-workspaces-perugino.ws">
    <Column x="0" y="0" open="true" selected="false" sform="false" next="8" name="A" caption="Macbeth image">
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
    <Column x="643" y="0" open="true" selected="false" sform="false" next="9" name="B" caption="False colour UV and IR images">
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
    <Column x="1125" y="0" open="true" selected="true" sform="false" next="13" name="C" caption="luminescence images">
      <Subcolumn vislevel="3">
        <Row popup="false" name="C12">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (uvlstray.C32)"/>
          </Rhs>
        </Row>
        <Row popup="false" name="C2">
          <Rhs vislevel="2" flags="6">
            <Subcolumn vislevel="1"/>
            <iText formula="export (uvlstray.A5)"/>
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
