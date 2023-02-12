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
                        <li>114514</li>
                        <li>1919810</li>
                        <!-- 使用图标字体electronic font -->
                    </ul>
                </div>
<%--                <div class="NO-bd">文字</div>--%>
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

            <%--var mw = [];--%>
            <%--mw = "${MostWord}";--%>
            let data = [];

            // console.log(mw);

            // for (var i = 0; i < 10; i++) {
            <c:forEach items="${MostWord}" var="mw" varStatus="i">

                var obj = {
                    name: "${mw.topWord}",
                    value: "${mw.num}",
                    symbolSize: "${mw.num/5}",
                    label: {
                        fontSize: "${mw.num/5}",
                        color: 'rgb(' +
                            Math.round(Math.random() * 255) +
                            ', ' +
                            Math.round(Math.random() * 255) +
                            ', ' +
                            Math.round(Math.random() * 255) +
                            ')'
                        // normal: {
                        //     color: 'rgb(' +
                        //         Math.round(Math.random() * 255) +
                        //         ', ' +
                        //         Math.round(Math.random() * 255) +
                        //         ', ' +
                        //         Math.round(Math.random() * 255) +
                        //         ')'
                        // }
                    },
                    itemStyle: {
                        normal: {
                            color: 'rgba(9,42,105,0.98)'
                        }
                    }

                }
                data.push(obj)

            </c:forEach>
            // }
            option = {

                backgroundColor:'rgba(9,42,105,0.98)',
                // title: {
                //     text: '颜色随机的气泡图',
                //     x: 'center',
                //     y: 'top'
                // },
                tooltip: {
                    show: true
                },
                grid: {
                    // right: '12%'

                    top: '10%',
                    bottom: '5%'
                },
                series: [{
                    type: 'graph', // 关系图
                    layout: 'force', //图的布局，类型为力导图，'circular' 采用环形布局
                    force: {
                        repulsion: [100, 150], //节点之间的斥力因子。支持数组表达斥力范围，值越大斥力越大。
                        edgeLength: 100 //边的两个节点之间的距离，这个距离也会受 repulsion。[10, 50] 。值越小则长度越长
                    },
                    roam: true,
                    label: {
                        normal: {
                            show: true
                        }

                    },
                    data
                }]
            };


            myChart1.setOption(option);
        })();


        (function() {
            var myChart2 = echarts.init(document.querySelector('.bar .chart'));


            let nums = [];
            let ownername = [];

            <c:forEach items="${MostTimes}" var="mt">

            nums.push(${mt.num});
            ownername.push("${mt.owner_name}");

            </c:forEach>



            // var data=[50, 60, 70,20,30,10];
            // var className=['1年级','2年级','3年级','4年级','5年级','6年级'];
            var colorList=['#39B3FF','#47E0E0','#7891D9','#83D978','#C7A530','#FF8439','#39B3FF','#47E0E0','#7891D9','#83D978','#C7A530','#FF8439'];
            var defaultData=[100,100,100,100,100,100];
            option = {
                legend:{
                    data:['次数'],
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
                    data: ownername
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

            myChart2.setOption(option);
        })();


        (function() {

            var myChart3 = echarts.init(document.querySelector('.line .chart'));
            // var myChart3 = echarts.init(document.querySelector('.char'));



            // let xData = ["2018年", "2019年", "2020年", "2021年"];
            // let legendData = ["第一产业", "第三产业"]; //图例
            // let firstIndustry = [72, 37, 4, 75]; //第一产业
            // let thirdIndustry = [8, 15, 34, 31]; //第三产业

            let legendData = ["时间长度","播放量"]; //图例
            var up = [];
            let title = [];
            let length = [];
            let nums = [];
            let release = [];

            <c:set var="min_length" value="1919810" scope="request"/>
            <c:set var="max_length" value="1" scope="request"/>
            <c:set var="min_num" value="1919810" scope="request"/>
            <c:set var="max_num" value="1" scope="request"/>
            // let min_length = 1919810, max_length = -1, min_num = 1919810, max_num = -1;

            <c:forEach items="${MostTimeLengthInfo}" var="mt">


                <%--if(${mt.time_length>2})console.log("3355654");--%>
                // if ()
                <c:if test="${mt.time_length*1>max_length}">
                    <c:set var="max_length" value="${mt.time_length}"/>
                </c:if>
                <c:if test="${mt.time_length*1<min_length}">
                    <c:set var="min_length" value="${mt.time_length}"/>
                </c:if>
                <c:if test="${mt.nums*1>max_num}">
                    <c:set var="max_num" value="${mt.nums}"/>
                </c:if>
                <c:if test="${mt.nums*1<min_num}">
                    <c:set var="min_num" value="${mt.nums}"/>
                </c:if>


                up.push("${mt.owner_name}");
                title.push("${mt.title}");
                length.push(${mt.time_length});
                nums.push(${mt.nums});
                release.push(${mt.release_time});


            </c:forEach>

            option = {
                backgroundColor:"#061740",
                grid: {
                    x: 0,
                    y: 0,
                    x2: 0,
                    y2: 0,
                    top: '5%',
                    left: '3%',
                    right: '3%',
                    bottom: '5%',
                    containLabel: true,
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        crossStyle: {
                            color: '#999'
                        }
                    },
                    // formatter:
                },
                xAxis: [
                    {
                        type: 'category',
                        axisTick: {
                            show: false,
                        },
                        axisLabel: {
                            color: 'rgba(36, 173, 254, 1)',
                            fontSize:'8',
                            rotate: 30,
                            interval: 0,
                        },
                        axisLine: {
                            show: false
                        },
                        data: up,
                    },
                    {
                        type: 'category',
                        show: false,
                        axisTick: {
                            show: false,
                        },
                        interval: 1,
                        axisLabel: {
                            color: 'rgba(36, 173, 254, 1)',
                            fontSize:'8'
                        },
                        axisLine: {
                            show: false
                        },
                        data: title,
                    },
                    // {
                    //     type: 'category',
                    //     show: false,
                    //     axisTick: {
                    //         show: false,
                    //     },
                    //     interval: 1,
                    //     axisLabel: {
                    //         color: 'rgba(36, 173, 254, 1)',
                    //         fontSize:'8'
                    //     },
                    //     axisLine: {
                    //         show: false
                    //     },
                    //     data: release,
                    // }
                ],
                yAxis: [
                    {
                        type: 'time',
                        name: '时间长度',
                        min: ${min_length*1},
                        max: ${max_length*1},
                        interval: ${(max_length-min_length)/5},
                        // interval: 10000,
                        axisLabel: {
                            // formatter: function(value) {
                            //     return value + '秒';
                            // },
                        },
                        axisLabel: {
                            textStyle: {
                                //坐标轴颜色
                                color: 'rgba(36, 173, 254, 1)',
                                fontSize:'8'
                            }
                        },
                        //坐标轴线样式
                        splitLine: {
                            show: true,
                            lineStyle: {
                                type: 'solid', //solid实线;dashed虚线
                                color: 'rgba(36, 173, 254, 0.2)'
                            }
                        },
                    },
                    {
                        type: 'value',
                        name: '播放量',
                        min: ${min_num*1},
                        max: ${max_num*1},
                        // interval: 10,
                        interval: ${(max_num-min_num)/5},
                        axisLabel: {
                            formatter: function(value) {
                                return value + '万次';
                            },
                        },
                        axisLabel: {
                            textStyle: {
                                //坐标轴颜色
                                color: 'rgba(36, 173, 254, 1)',
                                fontSize:'8'
                            }
                        },
                        //坐标轴线样式
                        splitLine: {
                            show: true,
                            lineStyle: {
                                type: 'solid',
                                color: 'rgba(36, 173, 254, 0.2)'
                            }
                        },
                    }
                ],
                series: [
                    {
                        name: "时间长度",
                        data: length,
                        type: 'line',
                        smooth: true, //true曲线; false折线
                        itemStyle: {
                            normal: {
                                color: '#ffc600', //改变折线点的颜色
                                lineStyle: {
                                    color: '#ffc600', //改变折线颜色
                                    type: 'solid'
                                }
                            }
                        },
                        yAxisIndex: 0,
                        areaStyle: {
                            //折线图颜色半透明
                            color: {
                                type: 'linear',
                                x: 0,
                                y: 0,
                                x2: 0,
                                y2: 1,
                                colorStops: [{
                                    offset: 0, color: 'rgba(255,198,0, 0.5)' // 0% 处的颜色
                                }, {
                                    offset: 1, color: 'rgba(255,198,0, 0.1)' // 100% 处的颜色
                                }],
                                global: false // 缺省为 false
                            }
                        }
                    },
                    {
                        name: "播放量",
                        data: nums,
                        type: 'line',
                        smooth: true, //true曲线; false折线
                        itemStyle: {
                            normal: {
                                color: '#24adfe', //改变折线点的颜色
                                lineStyle: {
                                    color: '#24adfe', //改变折线颜色
                                    type: 'solid'
                                }
                            }
                        },
                        yAxisIndex: 1,
                        areaStyle: {
                            //折线图颜色半透明
                            color: {
                                type: 'linear',
                                x: 0,
                                y: 0,
                                x2: 0,
                                y2: 1,
                                colorStops: [{
                                    offset: 0, color: 'rgba(36,173,254, 0.5)' // 0% 处的颜色
                                }, {
                                    offset: 1, color: 'rgba(52,112,252, 0.1)' // 100% 处的颜色
                                }],
                                global: false // 缺省为 false
                            }
                        }
                    },

                ]
            };

            myChart3.setOption(option);
        })();

        (function() {

            var myChart4 = echarts.init(document.querySelector('.bar2 .chart'));

            let max = [];
            let min = [];
            let avg = [];
            let ownername = [];

            <c:forEach items="${MostAveragePlays_MaxPlays_MinPlays}" var="mt">

            ownername.push("${mt.owner_name}");
            min.push("${mt.min_plays}");
            max.push("${mt.max_plays}");
            avg.push("${mt.average_plays}");

            </c:forEach>

            option = {
                backgroundColor:'rgba(9,42,105,0.98)',
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                legend: {
                    data: [
                        {
                            name: '最大值',
                            textStyle: {
                                color: '#50B6FA'
                            },
                            itemStyle: {
                                color: '#50B6FA'
                            },
                        },
                        {
                            name: '最小值',
                            textStyle: {
                                color: '#50FAAB'
                            },
                            itemStyle: {
                                color: '#50FAAB'
                            },
                        },
                        {
                            name: '平均值',
                            textStyle: {
                                color: 'rgb(246,125,37,5)'
                            },
                            itemStyle: {
                                color: 'rgb(246,125,37,5)'
                            },
                        }
                    ],
                    left: '66',
                    itemWidth: 8,             // 图例图形宽度
                    itemHeight: 8,
                    padding: [
                        15,  // 上
                        0, // 右
                        15,  // 下
                        0, // 左
                    ],
                    textStyle: {
                        fontFamily: 'PingFangSC-Regular',
                        fontSize: 14,
                        color: '#50B6FA',
                        lineHeight: 20,
                        fontWeight: '400',
                    },

                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'value',
                    axisTick: {
                        show: true,
                        inside: true,
                        alignWithLable: true
                    },
                    axisLine: {
                        show: true,
                        lineStyle: {
                            color: "#6A97FF",
                        },
                    },
                    axisLabel: {
                        color: "#D0DEFF",
                        fontSize: 14,
                        fontFamily: "PingFangSC-Regular",
                        align: "center",
                        fontWeight: "400",
                    },
                    boundaryGap: [0, 0.01],
                    splitLine: {//x轴分割线
                        show: false,
                    },
                },
                yAxis: {
                    type: 'category',
                    axisTick: {
                        show: false,
                    },
                    axisLabel: {
                        color: "#D0DEFF",
                        // fontSize: 14,
                        fontFamily: "PingFangSC-Regular",
                        align: "right",
                        fontWeight: "400",
                    },
                    axisLine: {
                        show: true,
                        lineStyle: {
                            color: "#6A97FF",
                        },
                    },
                    // data: ['南京', '徐州', '扬州', '常州', '连云港', '盐城', '宿迁',
                    //     '泰州', '南通', '镇江', '苏州', '无锡', '淮安']
                    data: ownername
                },
                series: [
                    {
                        name: '最大值',
                        type: 'bar',
                        color: '#50B6FA',
                        data: max,
                        itemStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(
                                    1,
                                    0,
                                    0,
                                    0,
                                    [
                                        {
                                            offset: 0,
                                            color: 'rgba(60, 120, 200, 1)'
                                        },
                                        {
                                            offset: 1,
                                            color: 'rgba(80, 182, 250, 0)'
                                        }
                                    ],
                                    false
                                )
                            }
                        },
                    },
                    {
                        name: '最小值',
                        type: 'bar',
                        color: '#50FAAB',
                        data: min,
                        itemStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(
                                    1,
                                    0,
                                    0,
                                    0,
                                    [
                                        {
                                            offset: 0,
                                            color: 'rgba(80, 250, 171, 1)'
                                        },
                                        {
                                            offset: 1,
                                            color: 'rgba(80, 250, 171, 0)'
                                        }
                                    ],
                                    false
                                )
                            }
                        },
                    },
                    {
                        name: '平均值',
                        type: 'bar',
                        color: '#FF8439',
                        data: avg,
                        itemStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(
                                    1,
                                    0,
                                    0,
                                    0,
                                    [
                                        {
                                            offset: 0,
                                            color: 'rgb(246,125,37,1)'
                                        },
                                        {
                                            offset: 1,
                                            color: 'rgb(246,125,37,0)'
                                        }
                                    ],
                                    false
                                )
                            }
                        },
                    }
                ]
            };



            myChart4.setOption(option);
        })();


        (function() {

            var myChart5 = echarts.init(document.querySelector('.char'));


            <%--let time = [];--%>
            <%--let timestr = [];--%>
            <%--let own = [];--%>
            <%--let title = [];--%>

            <%--<c:forEach items="${EarliestRelease}" var="mt">--%>

            <%--&lt;%&ndash;console.log("${mt.release_time}")&ndash;%&gt;--%>
            <%--time.push(${mt.release_time});--%>
            <%--timestr.push("${mt.release_time}");--%>
            <%--own.push("${mt.owner_name}");--%>
            <%--title.push("${mt.title}");--%>

            <%--</c:forEach>--%>
            let position=[
                [60, 40],[20, 50],[75, 70],[85, 26],[48, 22],[12, 90],[20, 5],[15, 33],[80, 90],[27, 65]
            ];

            var result = [
            <c:forEach items="${EarliestRelease}" var="mt" varStatus="i">
                {
                    // id: 1,
                    name: '${mt.owner_name}',
                    title:"${mt.title}",
                    time:"${mt.release_time}",
                    size: Math.round(Math.random() * 75+30),
                    color: '#00DEFF',
                    position: position[${i.index}],
                    // position: [Math.round(Math.random() * 100),Math.round(Math.random() * 100)],
                },
            </c:forEach>

            ];
            var data = [];
            // 渲染数据，并写入chart
            result.map((item) => {
                data.push({
                    name: item.name+"\n"+item.title+"\n"+item.time,
                    value: item.position,
                    symbolSize: item.size,
                    label: {
                        // color: '#31B4CD',
                        fontSize: 15,
                    },
                    itemStyle: {
                        normal: {
                            color: new echarts.graphic.RadialGradient(0.5, 0.5, 1, [
                                {
                                    offset: 0.2,
                                    color: 'rgba(27, 54, 72, 0.3)',
                                },
                                {
                                    offset: 1,
                                    color: item.color,
                                },
                            ]),
                            borderWidth: 3,
                            borderColor: item.color,
                        },
                    },
                });
            });
            option = {
                backgroundColor: '#061438',
                tooltip: {
                    show: true
                },
                grid: {
                    show: false,
                    top: 10,
                    bottom: 10,
                },
                xAxis: [
                    {
                        type: 'value',
                        show: false,
                        min: 0,
                        max: 100,
                    },
                ],
                yAxis: [
                    {
                        min: 0,
                        show: false,
                        max: 100,
                    },
                ],

                series: [
                    {
                        type: 'scatter',
                        symbol: 'circle',
                        symbolSize: 120,
                        label: {
                            normal: {
                                show: true,
                                formatter: '{b0}'+'',
                                // formatter:function(v){
                                //     own=v.name;
                                //     time=v.time;
                                //     title=v.title
                                //     return ""+own+time+title;
                                // },
                                color: '#fff',
                                textStyle: {
                                    fontSize: '20',
                                },
                            },
                        },
                        animationDurationUpdate: 500,
                        animationEasingUpdate: 500,
                        animationDelay: function (idx) {
                            // 越往后的数据延迟越大
                            return idx * 100;
                        },
                        data: data,
                    },
                ],
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