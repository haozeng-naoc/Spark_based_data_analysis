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


        var legendData = ['全精灵平均属性']; //图例
        var indicator = [{
            text: '攻击',
            max: 100,
        },
            {
                text: '防御',
                max: 100
            },
            {
                text: '血量',
                max: 100
            },
            {
                text: '特攻',
                max: 100,
            },
            {
                text: '特防',
                max: 100
            },
            {
                text: '速度',
                max: 100
            },
        ];
        var dataArr = [{

            <c:forEach items="${Dimension}" var="d">
            value: [${d.attack},${d.defense},${d.hp},${d.sp_attack},${d.sp_defense},${d.speed}],
            </c:forEach>
            name: legendData[0],
            itemStyle: {
                normal: {
                    lineStyle: {
                        color: '#55d7f2',
                    },
                    // shadowColor: '#4A99FF',
                    // shadowBlur: 10,
                },
            },
            areaStyle: {
                normal: { // 单项区域填充样式
                    color: {
                        type: 'linear',
                        x: 1, //右
                        y: 0, //下
                        x2: 1, //左
                        y2: 1, //上
                        colorStops: [{
                            offset: 0,
                            color: '#4A99FF'
                        }, {
                            offset: 1,
                            color: 'rgba(0,0,0,0)'
                        }],
                        globalCoord: false
                    },
                    opacity: 1 // 区域透明度
                }
            }
        }
        ];
        var colorArr = ['#55d7f2', '#4BFFFC']; //颜色
        option = {
            tooltip: {
                trigger: 'item',
                // formatter: function (params) {
                //
                // },
            },
            backgroundColor: '#101736',
            color: colorArr,
            legend: {
                orient:'vertical',
                // icon: 'circle', //图例形状
                data: legendData,
                top:20,
                left:20,
                itemWidth: 8, // 图例标记的图形宽度。[ default: 25 ]
                itemHeight: 8, // 图例标记的图形高度。[ default: 14 ]
                itemGap: 22, // 图例每项之间的间隔。[ default: 10 ]横向布局时为水平间隔，纵向布局时为纵向间隔。
                textStyle: {
                    fontSize: 16,
                    fontWeight: 'bold',
                    color: '#00E4FF',
                },
            },
            radar: {
                // shape: 'circle',
                name: {
                    textStyle: {
                        color: '#fff',
                        fontSize: 16
                    },
                },
                indicator: indicator,
                splitArea: { // 坐标轴在 grid 区域中的分隔区域，默认不显示。
                    show: true,
                    areaStyle: { // 分隔区域的样式设置。
                        color: ['rgba(255,255,255,0)', 'rgba(255,255,255,0)'], // 分隔区域颜色。分隔区域会按数组中颜色的顺序依次循环设置颜色。默认是一个深浅的间隔色。
                    }
                },
                axisLine: { //指向外圈文本的分隔线样式
                    lineStyle: {
                        color: '#153269'
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: '#2b75d2', // 分隔线颜色
                        width: 2, // 分隔线线宽
                    }
                },
            },
            series: [{
                type: 'radar',
                symbolSize: 8,
                symbol: 'circle',
                data: dataArr
            }]
        };


        myChart1.setOption(option);
    })();


    (function() {
        var myChart2 = echarts.init(document.querySelector('.bar .chart'));

        let type = [];
        let nums = [];

        <c:forEach items="${Legend}" var="t">

        nums.push(${t.num});
        type.push("${t.type}");
        <%--console.log(${t.num});--%>

        </c:forEach>

        chartXData = type;
        chartYData = [
            <c:forEach items="${Legend}" var="t">
                { value: ${t.num}, name: "${t.type}" },
            // { value: 1, name: "1" },
            </c:forEach>
        ];

//var colorList =['#228c38', '#1a57b2', '#b04b07', '#af8108'];
        var colorList = [
            '#9EEDFF',
            '#FFF693',
            '#8CC7FE',
            '#F5D0FC',
            '#F5C19B',
            '#CDFBC1',
            '#b9b7ff',
            '#FDB3B0',
            '#AC94FF',
            '#7ACC63',
            '#1A64F8',
            '#31B4CD',
            // '#7ACC63',
        ];
        var colorListSub = ['rgba(35,143,56,.5)', 'rgba(26,87,178,.5)', 'rgba(176,75,7,.5)', 'rgba(175,129,8,.5)'];
// 设置数据
        function setChartOption(data) {
            const formatData = [];
            var total = 0;
            var valueT = 0;
            for (var i = 0; i < chartYData.length; i++) {
                total += chartYData[i].value;
            }
            if(total>0){
                valueT=10;
            }
            data.forEach(function (item, index) {
                formatData.push(
                    {
                        value: item.value,
                        name: item.name,
                        itemStyle: {
                            normal: {
                                label: {
                                    show: false,
                                },
                                borderWidth: 10,
                                shadowBlur: 12,
                                borderRadius: 10,
                                borderColor: colorList[index],
                                shadowColor: colorList[index],
                                color: colorList[index],
                            },
                        },
                    },
                    {
                        value: valueT,
                        name: '',
                        itemStyle: {
                            normal: {
                                label: {
                                    show: false,
                                },
                                labelLine: {
                                    show: false,
                                },
                                color: 'rgba(0, 0, 0, 0)',
                                borderColor: 'rgba(0, 0, 0, 0)',
                                borderWidth: 0,
                            },
                        },
                    }
                );
            });

            return formatData;
        }
        function generateData(totalNum, bigvalue, smallvalue, color) {
            let dataArr = [];
            for (var i = 0; i < totalNum; i++) {
                if (i % 4 === 0) {
                    dataArr.push({
                        name: (i + 1).toString(),
                        value: bigvalue,
                        itemStyle: {
                            normal: {
                                borderWidth: 8,
                                shadowBlur: 10,
                                borderRadius: 10,
                                borderColor: color,
                                shadowColor: color,
                                color: color,
                            },
                        },
                    });
                } else {
                    dataArr.push({
                        name: (i + 1).toString(),
                        value: smallvalue,
                        itemStyle: {
                            normal: {
                                color: 'rgba(0,0,0,0)',
                                borderWidth: 0,
                            },
                        },
                    });
                }
            }
            return dataArr;
        }
        let dolitData = generateData(100, 25, 20, '#AC94FF');
        function getOption(radius) {
            let option = {
                title: [{
                    text: '{name|' + '传奇精灵数量' + '}\n{val|}',
                    top: '42%',
                    left: 'center',
                    textStyle: {
                        rich: {
                            name: {
                                fontSize: 14,
                                fontWeight: 'normal',
                                color: '#fefefe',
                                padding: [10, 0]
                            },
                            val: {
                                fontSize: 32,
                                fontWeight: 'bolder',
                                color: '#fefefe',
                            }
                        }
                    }
                }],
                backgroundColor: '#0A1934',
                tooltip: {
                    trigger: 'item',
                    formatter: function (params) {
                        var percent = 0;
                        var total = 0;
                        for (var i = 0; i < chartYData.length; i++) {
                            total += chartYData[i].value;
                        }
                        if (total !== 0) {
                            percent = ((params.value / total) * 100).toFixed(0);
                        }
                        if (params.name !== '') {
                            return params.name+': '+params.value+' ('+percent+'%)';
                        }else{
                            return '';
                        }
                    },
                },
                legend: {
                    orient: 'vertical',
                    textStyle: {
                        color: '#fff',
                    },
                    right: '10%',
                    top: '25%',
                    show: false,
                    data: chartXData,
                },
                series: [
                    {
                        type: 'pie',
                        radius: ['50%', '75%'],
                        //            roseType: 'radius',
                        clockwise: false,
                        z: 10,
                        itemStyle: {
                            normal: {
                                label: {
                                    position: 'outside',
                                    alignTo: 'edge',
                                    margin: 1,
                                    formatter: function (params) {
                                        var percent = 0;
                                        var total = 0;
                                        for (var i = 0; i < chartYData.length; i++) {
                                            total += chartYData[i].value;
                                        }
                                        if (total !== 0) {
                                            percent = ((params.value / total) * 100).toFixed(0);
                                        }

                                        if (params.name !== '') {
                                            return (
                                                '{b|' + params.name + '}\n{hr|}\n{d|' + params.value + ' (' + percent + '%)} '
                                            );
                                        } else {
                                            return '';
                                        }
                                    },
                                    rich: {
                                        b: {
                                            fontSize: 10,
                                            color: '#fff',
                                            align: 'left',
                                            padding: 4,
                                        },
                                        hr: {
                                            borderColor: '#12EABE',
                                            width: '100%',
                                            borderWidth: 1,
                                            height: 0,
                                        },
                                        d: {
                                            fontSize: 8,
                                            color: '#fff',
                                            align: 'left',
                                            padding: 4,
                                        },
                                        c: {
                                            fontSize: 10,
                                            color: '#fff',
                                            align: 'center',
                                            padding: 4,
                                        },
                                    },
                                },
                                labelLine: {
                                    normal: {
                                        length: 5,
                                        length2: 5,
                                        lineStyle: {
                                            width: 1,
                                        },
                                    },
                                },
                            },
                        },
                        data: setChartOption(chartYData),
                    },
                    // 中心的圆圈
                    {
                        color: '#FFFFFF',
                        type: 'pie',
                        silent: true,
                        radius: [radius + 1 + '%', radius + '%'],
                        label: {
                            normal: {
                                show: false,
                            },
                            emphasis: {
                                show: false,
                            },
                        },
                        labelLine: {
                            normal: {
                                show: false,
                            },
                            emphasis: {
                                show: false,
                            },
                        },
                        tooltip: {
                            show: false,
                        },
                        data: dolitData,
                        animation: false,
                    },
                ],
            };
            return option;
        }

        var timerId;
        let [minradius, radius, maxradius] = [24, 24, 28]; // 初始缩放尺寸
        /**let isBig = true // 缩放动画 标识
         function draw() {
            if (isBig) {
                radius = radius + 0.4;
                if (radius > maxradius) {
                    isBig = false;
                }
            } else {
                radius = radius - 0.3;
                if (radius < minradius) {
                    isBig = true;
                }
            }
            let option = getOption(radius);
    myChart.setOption(option, true);
    //window.requestAnimationFrame(draw);
}
         if (timerId) {
    clearInterval(timerId);
}
         timerId = setInterval(function () {
    //用setInterval做动画感觉有问题
    draw();
}, 100);**/
        myChart2.setOption(getOption(radius), true);


        // myChart2.setOption(option);
    })();


    (function() {

        var myChart3 = echarts.init(document.querySelector('.line .chart'));
        // var myChart3 = echarts.init(document.querySelector('.char'));

        let companyData = [

        <c:forEach items="${Abilities}" var="ab">
            { companyTypeName: '${ab.ability}', totalNumber: ${ab.num} },
        </c:forEach>
        ];
        let dataName = [];
        let data1 = [];
        let defaultData = [];
        let maxData = 0;
        companyData.forEach((item) => {
            dataName.push(item.companyTypeName);
            data1.push(item.totalNumber);
            if (maxData < item.totalNumber) {
                maxData = item.totalNumber;
            }
        });
        for (let i = 0; i < data1.length; i++) {
            defaultData.push(maxData);
        }
        var colorList = [
            '#00AAFF',
            '#A52A2A',
            '#FF752D',
            '#FFCF31',
            '#FF3129',
            '#006400',
            '#8B4513',
            '#FF8C00',
            '#FFB6C1',
            '#7B68EE',
            '#87CEFA',
            '#008000',
            '#D2B48C',
        ];
// var defaultData = [800, 800, 800, 800]
        option = {
            title: {
                text: '最多的精灵特性',
                x:'right',
                y:'top',
                textStyle: {
                    color: '#ffffff',
                    // fontSize: '12',
                },
            },
            backgroundColor: '#36467E',
            grid: {
                left: '5%',
                right: '5%',
                bottom: '5%',
                top: '10%',
                containLabel: true,
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow',
                },
                position: function (point, params, dom, rect, size) {
                    // console.log(point)

                    return [point[0], point[1]];
                },
                confine: false,
                // formatter: '{b}:{c}'
                formatter: function (params) {
                    // console.log(params)
                    let title = params[0].name;
                    if (title.length > 30) {
                        title = title.substring(0, 15) + '<br/>' + title.substring(15, 30) + '<br/>' + title.substring(30);
                    } else if (title.length > 15) {
                        title = title.substring(0, 15) + '<br/>' + title.substring(15);
                    }
                    let name = title + ' : ' + params[0].value;
                    return name;
                },
            },
            // backgroundColor: 'rgb(20,28,52)',
            xAxis: {
                show: false,
                type: 'value',
            },
            yAxis: [
                {
                    type: 'category',
                    inverse: true,
                    // axisLabel: {
                    //   show: true,
                    //   textStyle: {
                    //     color: '#fff'
                    //   },
                    //   rotate: 0
                    // },
                    splitLine: {
                        show: false,
                    },
                    axisTick: {
                        show: false,
                    },
                    axisLine: {
                        show: false,
                    },
                    axisLabel: {
                        textStyle: {
                            color: '#ffffff',
                            fontSize: '12',
                        },
                        formatter: function (value) {
                            value = value.length > 7 ? value.substring(0, 7) + '...' : value;
                            return value;
                        },
                    },
                    data: dataName,
                },
                {
                    type: 'category',
                    inverse: true,
                    axisTick: 'none',
                    axisLine: 'none',
                    show: true,
                    axisLabel: {
                        textStyle: {
                            color: '#ffffff',
                            fontSize: '12',
                        },
                        formatter: function (value) {
                            return value;
                        },
                    },
                    data: data1,
                },
            ],
            series: [
                {
                    name: '数量',
                    type: 'bar',
                    zlevel: 1,
                    itemStyle: {
                        normal: {
                            barBorderRadius: [0, 30, 30, 0],
                            color: (params) => {
                                return new echarts.graphic.LinearGradient(0, 0, 1, 0, [
                                    {
                                        offset: 0,
                                        color: 'rgba(54,69,129,1)',
                                    },
                                    {
                                        offset: 0.8,
                                        color: colorList[params.dataIndex],
                                    },
                                    {
                                        offset: 1,
                                        color: 'rgba(255,255,255,0.8)',
                                    },
                                ]);
                            },
                            // color: (params) => {
                            //   return colorList[params.dataIndex]
                            // }
                        },
                    },
                    barWidth: 15,
                    data: data1,
                },
                {
                    name: '背景',
                    type: 'bar',
                    barWidth: 15,
                    barGap: '-100%',
                    data: defaultData,
                    itemStyle: {
                        normal: {
                            color: '#1B375E',
                            barBorderRadius: [0, 30, 30, 0],
                        },
                    },
                },
            ],
        };

        myChart3.setOption(option);
    })();

    (function() {

        var myChart4 = echarts.init(document.querySelector('.char'));


        let data = []
        <c:forEach items="${Type}" var="t" varStatus="i">

            var obj = {
                name: "${t.type}",
                value: "${t.count}",
                symbolSize: "${t.count/2+20}",
                label: {
                    fontSize: "${t.count/2+20}",
                    itemStyle: {
                        normal: {
                            color: 'rgb(' +
                                Math.round(Math.random() * 255) +
                                ', ' +
                                Math.round(Math.random() * 255) +
                                ', ' +
                                Math.round(Math.random() * 255) +
                                ')'
                        }
                    }
                }
            };
            data.push(obj);

        </c:forEach>


        option = {
            title: {
                text: '精灵数量最多的种类',
                x:'right',
                y:'top'
            },
            tooltip: {
                show: true
            },
            grid: {
                // right: '12%'
            },
            series: [{
                type: 'graph', // 关系图
                layout: 'force', //图的布局，类型为力导图，'circular' 采用环形布局
                force: {
                    repulsion: [150, 250], //节点之间的斥力因子。支持数组表达斥力范围，值越大斥力越大。
                    edgeLength: 15 //边的两个节点之间的距离，这个距离也会受 repulsion。[10, 50] 。值越小则长度越长
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


        myChart4.setOption(option);
    })();


    (function() {



        var myChart5 = echarts.init(document.querySelector('.bar2 .chart'));

        var sum = 0;

        <c:forEach items="${Generation}" var="g">
            sum+=${g.num};
            // console.log(sum)
        </c:forEach>
        //世代占比


        let bgColor = '#001037';
        let title = '精灵总数';
        let color = ['#38cafb', '#4caff9', '#4adeca', '#2aa7ee', '#0270f2', '#488cf7','#1A64F8'];
        let echartData = [

            <c:forEach items="${Generation}" var="g">
            {
                name: "第${g.generation}世代",
                value: ${g.num}
            },
            </c:forEach>
        ];

        let formatNumber = function(num) {
            let reg = /(?=(\B)(\d{3})+$)/g;
            return num.toString().replace(reg, ',');
        }
        // let total = echartData.reduce((a, b) => {
        //     return a + b.value * 1
        // }, 0);

        option = {
            tooltip: {
                trigger: 'item',
                formatter: function (params) {
                    var percent = 0;
                    var total = 0;
                    for (var i = 0; i < chartYData.length; i++) {
                        total += chartYData[i].value;
                    }
                    if (total !== 0) {
                        percent = ((params.value / total) * 100).toFixed(0);
                    }
                    if (params.name !== '') {
                        return params.name+': '+params.value+' ('+percent+'%)';
                    }else{
                        return '';
                    }
                },
            },
            grid: {

                left: '10%',
                right: '10%',
                top: '2%',
                bottom: '2%',

                containLabel: true
            },
            backgroundColor: bgColor,
            color: color,
            // tooltip: {
            //     trigger: 'item'
            // },
            title: [{
                text: '{name|' + title + '}\n{val|' + formatNumber(sum) + '}',
                top: 'center',
                left: 'center',
                textStyle: {
                    rich: {
                        name: {
                            fontSize: 14,
                            fontWeight: 'normal',
                            color: '#fefefe',
                            padding: [10, 0]
                        },
                        val: {
                            fontSize: 32,
                            fontWeight: 'bolder',
                            color: '#fefefe',
                        }
                    }
                }
            },{
                text: '单位：个',
                top: 20,
                left: 20,
                textStyle: {
                    fontSize: 14,
                    color:'#666666',
                    fontWeight: 400
                },
                show: false
            }],
            series: [{
                type: 'pie',
                roseType: 'radius',
                radius: ['25%', '60%'],
                center: ['50%', '50%'],
                data: echartData,
                hoverAnimation: false,
                itemStyle: {
                    normal: {
                        borderColor: bgColor,
                        borderWidth: 2
                    }
                },
                labelLine: {
                    normal: {
                        length: 15,
                        // length2: 120,
                        lineStyle: {
                            // color: '#e6e6e6'
                        }
                    }
                },
                label: {
                    normal: {
                        formatter: params => {
                            return (
                                '{icon|●}{name|' + params.name + '}\n{value|' +
                                formatNumber(params.value) + '}'
                            );
                        },
                        // padding: [0 , -100, 25, -100],
                        rich: {
                            icon: {
                                fontSize: 16,
                                color: 'inherit'
                            },
                            name: {
                                fontSize: 18,
                                padding: [0, 0, 0, 10],
                                color: '#fefefe'
                            },
                            value: {
                                fontSize: 14,
                                fontWeight: 'bolder',
                                padding: [10, 0, 0, 20],
                                color: 'inherit'
                                // color: '#333333'
                            }
                        }
                    }
                },
            }]
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