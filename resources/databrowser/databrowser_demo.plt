<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<databrowser>
    <title>
        <text></text>
        <font>1|Sans|12.0|1|GTK|1|</font>
    </title>
    <graph_settings>
        <show_title>true</show_title>
        <show_legend>true</show_legend>
        <show_plot_area_border>false</show_plot_area_border>
        <transparent>false</transparent>
    </graph_settings>
    <scroll>true</scroll>
    <update_period>3.0</update_period>
    <start>-30 minutes 0.0 seconds</start>
    <end>now</end>
    <time_axis>
        <axis>
            <name>Time</name>
            <font>1|Sans|10.0|1|GTK|1|</font>
            <scale_font>1|Sans|10.0|0|GTK|1|</scale_font>
            <color>
                <red>0</red>
                <green>0</green>
                <blue>0</blue>
            </color>
            <min>1.40908891019E12</min>
            <max>1.40908981019E12</max>
            <log_scale>false</log_scale>
            <autoscale>false</autoscale>
            <visible>true</visible>
            <grid_line>
                <show_grid_line>false</show_grid_line>
                <dash_grid_line>true</dash_grid_line>
            </grid_line>
            <format>
                <auto_format>true</auto_format>
                <time_format>true</time_format>
                <format_pattern>HH:mm:ss</format_pattern>
            </format>
        </axis>
    </time_axis>
    <background>
        <red>255</red>
        <green>255</green>
        <blue>255</blue>
    </background>
    <archive_rescale>NONE</archive_rescale>
    <axes>
        <axis>
            <name>Position (Degrees)</name>
            <font>1|Sans|10.0|1|GTK|1|</font>
            <scale_font>1|Sans|10.0|0|GTK|1|</scale_font>
            <color>
                <red>0</red>
                <green>0</green>
                <blue>0</blue>
            </color>
            <min>-15.0</min>
            <max>15.0</max>
            <log_scale>false</log_scale>
            <autoscale>false</autoscale>
            <visible>true</visible>
            <grid_line>
                <show_grid_line>false</show_grid_line>
                <dash_grid_line>true</dash_grid_line>
            </grid_line>
            <format>
                <auto_format>true</auto_format>
                <time_format>false</time_format>
                <format_pattern>############.##</format_pattern>
            </format>
        </axis>
    </axes>
    <annotations>
    </annotations>
    <pvlist>
        <pv>
            <name>XF:31IDA-OP{Tbl-Ax:X1}Mtr</name>
            <display_name>XF:31IDA-OP{Tbl-Ax:X1}Mtr</display_name>
            <visible>true</visible>
            <axis>0</axis>
            <linewidth>2</linewidth>
            <color>
                <red>255</red>
                <green>0</green>
                <blue>0</blue>
            </color>
            <trace_type>AREA</trace_type>
            <waveform_index>0</waveform_index>
            <period>0.0</period>
            <ring_size>5000</ring_size>
            <request>OPTIMIZED</request>
            <archive>
                <name>default/Current</name>
                <url>xnds://ca01.cs.nsls2.local/cgi-bin/ArchiveDataServer.cgi</url>
                <key>4</key>
            </archive>
        </pv>
        <pv>
            <name>XF:31IDA-OP{Tbl-Ax:X1}Mtr.RBV</name>
            <display_name>XF:31IDA-OP{Tbl-Ax:X1}Mtr.RBV</display_name>
            <visible>true</visible>
            <axis>0</axis>
            <linewidth>2</linewidth>
            <color>
                <red>0</red>
                <green>0</green>
                <blue>255</blue>
            </color>
            <trace_type>AREA</trace_type>
            <waveform_index>0</waveform_index>
            <period>0.0</period>
            <ring_size>5000</ring_size>
            <request>OPTIMIZED</request>
            <archive>
                <name>default/Current</name>
                <url>xnds://ca01.cs.nsls2.local/cgi-bin/ArchiveDataServer.cgi</url>
                <key>4</key>
            </archive>
        </pv>
    </pvlist>
</databrowser>