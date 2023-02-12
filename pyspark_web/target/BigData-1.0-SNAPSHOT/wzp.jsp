<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/index.css">
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>

    <%--    <c:set var="mw" value="${MostWord}" scope="application"/>--%>
</head>

<body>


<%--    <input id="mw" type="hidden" value="${MostWord}"/>--%>



<header>
    <h1>极大无关组</h1>
    <div class="showTime">114514</div>
</header>
<!-- <div class="box">
    <script src="js/flexible.js">暂时没有</script>

</div> -->
<section class="mainbox">
    <div class="column">
        <div class="panel bar">
            <%--                <h2>柱形图</h2>--%>
            <div class="chart">

            </div>
            <div class="panel-footer"></div>
        </div>
        <div class="panel line">
            <%--                <h2>折线图</h2>--%>
            <div class="chart">

            </div>
            <div class="panel-footer"></div>
        </div>
        <!-- <div class="column">
            <div class="panel progress">
                <h2>饼状图</h2>
                <div class="chart">

                </div>
                <div class="panel-footer"></div>
            </div>
        </div> -->
    </div>
    <div class="column column_main">
        <div class="NO">
            <div class="NO-hd">
                <ul>
                    <li>国际</li>
                    <li>象棋</li>
                    <!-- 使用图标字体electronic font -->
                </ul>
            </div>
<%--            <div class="NO-bd">文字</div>--%>
        </div>
        <div class="char">

        </div>
    </div>
    <div class="column">
        <div class="panel bar2">
            <%--                <h2>柱形图</h2>--%>
            <div class="chart">

            </div>
            <div class="panel-footer"></div>
        </div>
        <div class="panel line2">
            <%--                <h2>折线图</h2>--%>
            <div class="chart">

            </div>
            <div class="panel-footer"></div>
        </div>
        <!-- <div class="column">
            <div class="panel pie2">
                <h2>饼状图</h2>
                <div class="chart">

                </div>
                <div class="panel-footer"></div>
            </div>
        </div> -->
    </div>

</section>

<%--    <script src=js/lk.js></script>--%>
<script>
    (function() {



        var myChart1 = echarts.init(document.querySelector('.line2 .chart'));
        // var myChart1 = echarts.init(document.querySelector('.char'));


        let nums = [];
        let id = [];

        <c:forEach items="${Fastestfinish}" var="mt">

        nums.push(${mt.min_turns});
        id.push("${mt.id}");

        </c:forEach>



        // var data=[50, 60, 70,20,30,10];
        // var className=['1年级','2年级','3年级','4年级','5年级','6年级'];
        var colorList=['#39B3FF','#47E0E0','#7891D9','#83D978','#C7A530','#FF8439','#39B3FF','#47E0E0','#7891D9','#83D978','#C7A530','#FF8439'];
        var defaultData=[100,100,100,100,100,100];
        option = {
            legend:{
                data:['回合数'],
                icon:'circle',
                bottom:10,
                textStyle:{
                    color:'#ffffff'
                }
            },
            grid: {
                left: '5%',
                right: '5%',
                bottom: '5%',
                top: '10%',
                containLabel: true
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                },
                formatter: function(params) {
                    return params[0].name + '<br/>' +
                        "<span style='display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:rgba(36,207,233,0.9)'></span>" +
                        // params[0].seriesName + ' : ' + Number((params[0].value.toFixed(4) / 10000).toFixed(2)).toLocaleString() + ' <br/>'
                        params[0].seriesName + ' : ' + params[0].value
                }
            },
            backgroundColor: 'rgb(20,28,52)',
            xAxis: {
                type: 'value',
                axisLine: {
                    show: true
                },
                splitLine: {
                    show: false
                },
            },
            yAxis: [{
                type: 'category',
                inverse: true,
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff'
                    },
                },
                splitLine: {
                    show: false
                },
                axisTick: {
                    show: true
                },
                axisLine: {
                    show: true
                },
                data: id
            }, {
                type: 'category',
                inverse: true,
                axisTick: 'none',
                axisLine: 'none',
                show: true,
                axisLabel: {
                    textStyle: {
                        color: '#ffffff',
                        fontSize: '12'
                    },
                    formatter: function(value) {
                        return value + '次';
                    },
                },
                data: nums
            }],
            series: [{
                name: '次数',
                type: 'bar',
                zlevel: 1,
                itemStyle: {
                    normal: {
                        barBorderRadius: 0,
                        // color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                        //     offset: 0,
                        //     color: 'rgb(57,89,255,1)'
                        // }, {
                        //     offset: 1,
                        //     color: 'rgb(46,200,207,1)'
                        // }]),
                        color: (params) => {
                            return colorList[params.dataIndex]
                        }
                    },
                },
                barWidth: 20,
                data: nums
            }
            ]
        };

        myChart1.setOption(option);
    })();


    (function() {
        var myChart2 = echarts.init(document.querySelector('.bar .chart'));

        option = {

            color: ['#76B8FE','#B09BFE','#EFA1C5','#EFE7A1','#EFBDA1','#E5E5E5','#e7bcf3','#8378ea'],
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            toolbox: {
                show : true,

            },
            legend: {
                itemlength:20,
                itemWidth:15,
                orient: 'vertical',
                left:'70%',
                align:'left',
                top:'middle',
                textStyle: {
                    color:'#909399'
                },
                height:150
            },
            series : [
                {
                    label:{
                        show:false,
                    },
                    name:'回合结束原因',
                    type:'pie',
                    radius : [0, 75],
                    data:[

                        <c:forEach items="${Mostfinishstatus}" var="mt">
                            {value:${mt.num}, name:'${mt.victory_status}'},
                        </c:forEach>

                    ]
                }
            ]
        };


        myChart2.setOption(option);
    })();


    (function() {

        var myChart3 = echarts.init(document.querySelector('.line .chart'));
        // var myChart3 = echarts.init(document.querySelector('.char'));

        const attackSourcesColor = [
            new echarts.graphic.LinearGradient(0, 1, 1, 1, [
                { offset: 0, color: 'rgba(255, 85, 85, 0.1)' },
                { offset: 1, color: 'rgba(255, 85, 85, 1)' },
            ]),
            new echarts.graphic.LinearGradient(0, 1, 1, 1, [
                { offset: 0, color: 'rgba(255, 194, 0, 0.1)' },
                { offset: 1, color: 'rgba(255, 194, 0, 1)' },
            ]),
            new echarts.graphic.LinearGradient(0, 1, 1, 1, [
                { offset: 0, color: 'rgba(49, 201, 81, 0.1)' },
                { offset: 1, color: 'rgba(49, 201, 81, 1)' },
            ]),
            new echarts.graphic.LinearGradient(0, 1, 1, 1, [
                { offset: 0, color: 'rgba(0, 221, 255, 0.1)' },
                { offset: 1, color: 'rgba(0, 221, 255, 1)' },
            ]),
        ];
        const shadowSourcesColor = [
            new echarts.graphic.LinearGradient(0, 1, 0, 0, [
                { offset: 0, color: 'rgba(255, 85, 85, 0)' },
                { offset: 1, color: 'rgba(255, 85, 85, 0.44)' },
            ]),
            new echarts.graphic.LinearGradient(0, 1, 0, 0, [
                { offset: 0, color: 'rgba(255, 194, 0, 0)' },
                { offset: 1, color: 'rgba(255, 194, 0, 0.44)' },
            ]),
            new echarts.graphic.LinearGradient(0, 1, 0, 0, [
                { offset: 0, color: 'rgba(49, 201, 81, 0)' },
                { offset: 1, color: 'rgba(49, 201, 81, 0.44)' },
            ]),
            new echarts.graphic.LinearGradient(0, 1, 0, 0, [
                { offset: 0, color: 'rgba(0, 221, 255, 0)' },
                { offset: 1, color: 'rgba(0, 221, 255, 0.44)' },
            ]),
        ];
        const borderColor = ['rgba(255, 85, 85, 1)', 'rgba(255, 194, 0, 1)', 'rgba(49, 201, 81, 1)', 'rgba(0, 221, 255, 1)'];




        let id = [];
        let nums = [];

        <c:forEach items="${Fastestmatch}" var="mt">

        nums.push(${mt.min_turns});
        id.push("${mt.white_id}");

        </c:forEach>

        const xdata = id;

        const seriesData = nums;
        const resultData = []
        seriesData.forEach(function(item, i) {
            const itemStyle = {
                borderColor: i > 3 ? borderColor[3] : borderColor[i],
                color: i > 3 ? shadowSourcesColor[3] : shadowSourcesColor[i]
            };
            resultData.push({
                value: item,
                itemStyle: itemStyle
            });
            return resultData
        });

        option = {
            backgroundColor: '#1C262F',
            grid: {

                left: '1%',
                right: '5%',
                top: '5%',
                bottom: '2%',

                containLabel: true
            },
            yAxis: {
                data: xdata,
                type: 'category',
                inverse: true,
                // axisLabel: {
                //     color: 'rgba(36, 173, 254, 1)',
                //     fontSize:'8',
                //     rotate: 30,
                //     interval: 0,
                // },
                axisLabel: {

                    interval: 0,
                    fontSize: 12,
                    axisTick: false,
                    color: '#FFFFFF',
                    fontWeight: 400,

                    // rotate: 30,
                    formatter(value = '') {
                        let result = '',
                            index = 0;
                        if (value.length <= 7) {
                            return value;
                        }
                        while (index < value.length) {
                            result += value.substring(index, (index += 7)) + '\n';
                        }
                        return result;
                    },
                    show: true,
                },
                axisLine: false,
            },
            xAxis: {
                position: 'top',
                type: 'value',
                axisLabel: {
                    fontSize: 12,
                    color: '#FFFFFF',
                    fontWeight: 400,
                    fontFamily: 'OPPOSans',
                    formatter: '{value}%',
                },
                splitLine: {
                    show: false,
                },
                axisLine: {
                    show: true,

                    lineStyle: {
                        color: '#ffffff',
                        opacity: 0.3,
                    },
                },
                axisTick: false,
            },
            series: [
                {
                    type: 'bar',
                    barWidth: 4,
                    data: resultData,
                    color: '#fff',
                    itemStyle: {
                        color: {
                            type: 'linear',
                            x: 0,
                            y: 0,
                            x2: 1,
                            y2: 0,
                            colorStops: [
                                {
                                    offset: 0,
                                    color: 'rgba(255,192,69, 0.1)',
                                },
                                {
                                    offset: 1,
                                    color: 'rgba(255,192,69,1)',
                                },
                            ],

                            globalCoord: false, // 缺省为 false
                        },
                    },
                    label: {
                        show: true,
                        position: 'right',
                        distance: 12,
                        formatter: '{c}%',
                        textStyle: {
                            color: '#fff',
                            fontSize: 14,
                            distance: 10,
                        },
                    },
                },
                {
                    type: 'scatter',
                    symbolSize: 14,
                    itemStyle: {
                        borderWidth: 1.5,
                        borderColor: '#FFC045',
                        opacity: 1,
                        color: {
                            x: 0,
                            y: 1,
                            x2: 0,
                            y2: 0,
                            type: 'linear',
                            colorStops: [
                                {
                                    offset: 0,
                                    color: 'rgba(255, 192, 69,0)',
                                },
                                {
                                    offset: 1,
                                    color: 'rgba(255, 192, 69, 0.44)',
                                },
                            ],
                        },
                    },
                    silent: true,
                    data: resultData
                },
                {
                    type: 'scatter',
                    symbolSize: 6,
                    itemStyle: {
                        color: {
                            type: 'radial',
                            r: 1,
                            colorStops: [
                                {
                                    offset: 0,
                                    color: '#FFFFFF',
                                },
                                {
                                    offset: 1,
                                    color: 'rgba(255,255,255, 0)',
                                },
                            ],
                            global: false,
                        },
                    },
                    silent: true,
                    data: [3, 1, 1, 1, 1, 1],
                },
            ],
        };


        myChart3.setOption(option);
    })();

    (function() {

        var myChart4 = echarts.init(document.querySelector('.bar2 .chart'));



        let id = [];
        let turn = [];
        <c:forEach items="${Averagefinish}" var="mt">
            turn.push(${mt.average_turns});
            id.push('${mt.white_id}');
        </c:forEach>

        option = {
            backgroundColor: '#ffffff',
            tooltip: {
                trigger: 'axis',
                show: true,
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                },
            },
            legend: {
                show:false
            },
            grid: {
                left: '10%',
                right: '10%',
                bottom: '10%',
                containLabel: true
            },
            xAxis: [{
                splitLine: {
                    show: false
                },
                type: 'value',
                show: false,
            }],
            yAxis: [{
                splitLine: {
                    show: false
                },
                axisLine: { //y轴
                    show: false
                },
                type: 'category',
                axisTick: {
                    show: false
                },
                inverse: true,
                data: id,
                axisLabel: {
                    color: '#303133',
                    fontSize: 14,
                }
            }],
            series: [{
                name: '报警次数',
                type: 'bar',
                barWidth: 8, // 柱子宽度
                label: {
                    show: true,
                    position: 'right', // 位置
                    color: '#303133',
                    fontSize: 14,
                    distance: 15, // 距离
                    formatter: '{c} 次' // 这里是数据展示的时候显示的数据
                }, // 柱子上方的数值
                itemStyle: {
                    barBorderRadius: [0, 0, 0, 0], // 圆角（左上、右上、右下、左下）

                    color: '#419fff'
                },
                data: turn
            }, ]
        };


        myChart4.setOption(option);
    })();


    (function() {

        var myChart5 = echarts.init(document.querySelector('.char'));


        let id = [];
        let nums = [];

        <c:forEach items="${Mostgames}" var="mt">

        nums.push(${mt.num});
        id.push("${mt.white_id}");

        </c:forEach>

        option = {
            xAxis: {
                type: 'category',
                data: id,
                axisLabel: {
                    color: 'rgba(36, 173, 254, 1)',
                    fontSize:'10',
                    rotate: 30,
                    interval: 0,
                },
            },
            yAxis: {
                type: 'value'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            series: [
                {
                    data: nums,
                    type: 'bar'
                }
            ]
        };


        myChart5.setOption(option);
    })();


    // (function() {
    //
    //     var myChart = echarts.init(document.querySelector('.char'));
    //
    //
    //     myChart.setOption(option);
    // })();
</script>



</body>

</html>