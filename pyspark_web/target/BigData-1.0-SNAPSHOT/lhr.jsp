<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
</head>

<body>
<div id="chart1" style="width: 1700px;height:900px;"></div>
<div id="chart2" style="width: 1700px;height:900px;"></div>
<div id="chart3" style="width: 1700px;height:900px;"></div>
<div id="chart4" style="width: 1700px;height:900px;"></div>
<div id="chart5" style="width: 1700px;height:900px;"></div>
<div id="chart6" style="width: 1700px;height:900px;"></div>
<div id="chart7" style="width: 1700px;height:900px;"></div>
<div id="chart8" style="width: 1700px;height:900px;"></div>
<div id="chart9" style="width: 1700px;height:900px;"></div>
<div id="chart10" style="width: 1700px;height:900px;"></div>
    <script>

//1--各种语言支持数top10
        (function e1() {
            var myChart1 = echarts.init(document.getElementById('chart1'));

            let language = [];
            let frequency = [];
            <c:forEach items="${language_count}" var="mt">
            language.push("${mt.language}");
            frequency.push(${mt.frequency});
            </c:forEach>

            option = {
                title: {
                    text: '各种语言支持数top10'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        crossStyle: {
                            color: '#999'
                        }
                    }
                },
                xAxis: {
                    type: 'category',
                    axisLabel:{
                        interval: 0
                    },
                    data: language,
                    axisLable:{textstyle: {fontSize:20}},
                },
                yAxis: {
                    type: 'value',
                    name: '支持数量',
                    axisLable:{textstyle: {fontSize:20}},
                },
                series: [
                    {
                        data: frequency,
                        type: 'bar',
                        showBackground: true,
                        backgroundStyle: {
                            color: 'rgba(180, 180, 180, 0.2)'
                        },
                        lable:{
                            normal:{
                                textstyle:{
                                    fontsize:20
                                }
                            }
                        }

                    }
                ]
            };
            myChart1.setOption(option);
        })();

//2--游戏类别
        (function e2() {
            var myChart2 = echarts.init(document.getElementById('chart2'));

            let catagory = [];
            let Frequency = [];
            <c:forEach items="${categories_count}" var="mt">
            catagory.push("${mt.catagory}");
            Frequency.push(${mt.frequency});
            </c:forEach>

            option = {
                title: {
                    text: '游戏类别'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        crossStyle: {
                            color: '#999'
                        }
                    }
                },
                xAxis: {
                    type: 'category',
                    axisLabel:{
                        interval: 0
                    },
                    data: catagory
                },
                yAxis: {
                    type: 'value',
                    name: '游戏数量',
                },
                series: [
                    {
                        data: Frequency,
                        type: 'bar',
                        showBackground: true,
                        backgroundStyle: {
                            color: 'rgba(180, 180, 180, 0.2)'
                        }
                    }
                ]
            };
            myChart2.setOption(option);
        })();

//3--制作游戏最多的年份
(function e3() {
    var myChart3 = echarts.init(document.getElementById('chart3'));

    let year = [];
    let name = [];
    <c:forEach items="${years}" var="mt">
    year.push("${mt.year}");
    name.push(${mt.name});
    </c:forEach>

    option = {
        title: {
            text: '各年度游戏发布数量'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        xAxis: {
            type: 'category',
            axisLabel:{
                interval: 0
            },
            data: year
        },
        yAxis: {
            type: 'value',
            name: '发布数量',
        },
        series: [
            {
                data: name,
                type: 'line'
            }
        ]
    };
    myChart3.setOption(option);
})();

//4--下载次数最多的游戏及其价格
(function e4() {
    var myChart4 = echarts.init(document.getElementById('chart4'));

    let name = [];
    let price = [];
    let owners_clean = [];
    <c:forEach items="${most_downloaded_games_price}" var="mt">
    name.push("${mt.name}");
    price.push(${mt.price});
    owners_clean.push(${mt.owners_clean});
    </c:forEach>

    // option = {
    //     title: {
    //         text: '下载量最多的游戏及其价格'
    //     },
    //     tooltip: {
    //         trigger: 'axis',
    //         axisPointer: {
    //             type: 'cross',
    //             crossStyle: {
    //                 color: '#999'
    //             }
    //         }
    //     },
    //     legend: {
    //         data: ['price', 'owners_clean']
    //     },
    //     xAxis: [
    //         {
    //             type: 'category',
    //             data: name,
    //             axisLabel:{
    //                 interval: 0
    //             },
    //             axisPointer: {
    //                 type: 'shadow'
    //             }
    //         }
    //     ],
    //     yAxis: [
    //         {
    //             type: 'value',
    //             name: 'price',
    //             min: 0,
    //             max: 80,
    //             interval: 10,
    //             axisLabel: {
    //                 formatter: '{value} $'
    //             }
    //         },
    //         {
    //             type: 'value',
    //             name: 'owners_clean',
    //             min: 0,
    //             max: 60000000,
    //             interval: 10000000,
    //             axisLabel: {
    //                 formatter: '{value} '
    //             }
    //         }
    //     ],
    //     series: [
    //         {
    //             name: 'owners_clean',
    //             type: 'bar',
    //             yAxisIndex: 1,
    //             tooltip: {
    //                 valueFormatter: function (value) {
    //                     return value ;
    //                 }
    //             },
    //             data: owners_clean
    //         },
    //         {
    //             name: 'price',
    //             type: 'bar',
    //             yAxisIndex: 0,
    //             tooltip: {
    //                 valueFormatter: function (value) {
    //                     return value + '$';
    //                 }
    //             },
    //             data: price
    //         }
    //     ]
    // };

    option = {
        title: {
            text: '下载次数最多的游戏及其价格'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {},
        grid: {
            left: '1%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [
                    {
                        type: 'value',
                        name: '价格',
                        min: 0,
                        max: 80,
                        interval: 10,
                        axisLabel: {
                            formatter: '{value} '
                        }
                    },
                    {
                        type: 'value',
                        name: '玩家数量',
                        min: 0,
                        max: 60000000,
                        interval: 10000000,
                        axisLabel: {
                            formatter: '{value} '
                        }
                    }
                ],
        yAxis: {
            type: 'category',
            data: name
        },
        series: [
            {
                name: '价格',
                type: 'bar',
                data: price,
                xAxisIndex: 0,
            },
            {
                name: '玩家数量',
                type: 'bar',
                data: owners_clean,
                xAxisIndex: 1,
            }
        ]
    };
    myChart4.setOption(option);
})();





//5--游戏发行商top10
(function e5() {
    var myChart5 = echarts.init(document.getElementById('chart5'));

    let developers = [];
    let sum_DLC_count = [];
    <c:forEach items="${top_publishers_total_downloads}" var="mt">
    developers.push("${mt.developers}");
    sum_DLC_count.push(${mt.sum_DLC_count});
    </c:forEach>

    option = {
        title: {
            text: '游戏发行商top10'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        xAxis: {
            type: 'category',
            axisLabel:{
                interval: 0
            },
            data: developers
        },
        yAxis: {
            type: 'value',
            name: '玩家数量',
        },
        series: [
            {
                data: sum_DLC_count,
                type: 'bar',
                showBackground: true,
                backgroundStyle: {
                    color: 'rgba(180, 180, 180, 0.2)'
                }
            }
        ]
    };
    myChart5.setOption(option);
})();


//6--下载次数最多的游戏的好评和差评top10
(function e6() {
    var myChart6 = echarts.init(document.getElementById('chart6'));

    let name = [];
    let positive_count = [];
    let negative_count = [];
    <c:forEach items="${Pos_neg}" var="mt">
    name.push("${mt.name}");
    positive_count.push(${mt.positive_count});
    negative_count.push(${mt.negative_count});
    </c:forEach>

    option = {
        title: {
            text: '下载次数最多的游戏top10及其好评差评量'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        grid: {
            left: '1%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        legend: {
            data: ['positive_count', 'negative_count']
        },
        yAxis: [
            {
                type: 'category',
                data: name,
                axisLabel:{
                    interval: 0
                },
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        xAxis: [
            {
                type: 'value',
                name: '好评数',
                // min: 0,
                // max: 1500000,
                // interval: 10,
                axisLabel: {
                    formatter: '{value} '
                }
            },
            {
                type: 'value',
                name: '差评数',
                // min: 0,
                // max: 60000000,
                // interval: 10000000,
                axisLabel: {
                    formatter: '{value} '
                }
            }
        ],
        series: [
            {
                name: 'positive_count',
                type: 'bar',
                xAxisIndex: 1,
                tooltip: {
                    valueFormatter: function (value) {
                        return value ;
                    }
                },
                data: positive_count
            },
            {
                name: 'negative_count',
                type: 'bar',
                xAxisIndex: 0,
                tooltip: {
                    valueFormatter: function (value) {
                        return value ;
                    }
                },
                data: negative_count
            }
        ]
    };


    myChart6.setOption(option);
})();

//7--好评率（好评数/评价总数）限制评价总数100000以上的游戏
(function e7() {
    var myChart7 = echarts.init(document.getElementById('chart7'));

    let name = [];
    let rate = [];
    <c:forEach items="${rate_rank}" var="mt">
    name.push("${mt.name}");
    rate.push(${mt.rate});
    </c:forEach>

    option = {
        title: {
            text: '评价数十万以上的游戏好评榜top10'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        yAxis: {
            type: 'category',
            axisLabel:{
                interval: 0
            },
            data: name,
        },
        xAxis: {
            type: 'value',
            name: '好评率',
        },
        series: [
            {
                data: rate,
                type: 'bar',
                showBackground: true,
                backgroundStyle: {
                    color: 'rgba(180, 180, 180, 0.2)'
                }
            }
        ]
    };
    myChart7.setOption(option);
})();

//8--Mac、Win、Linux中平均游戏价格
(function e8() {
    var myChart8 = echarts.init(document.getElementById('chart8'));

    let win_price = [];
    let mac_price = [];
    let linux_price = [];
    <c:forEach items="${Average_price}" var="mt">
    win_price.push(${mt.win_price});
    mac_price.push(${mt.mac_price});
    linux_price.push(${mt.linux_price});
    </c:forEach>

    let price = [win_price[0],mac_price[0],linux_price[0]]

    option = {
        title: {
            text: '三个操作系统Steam游戏平均价格'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        xAxis: {
            type: 'category',
            axisLabel:{
                interval: 0
            },
            data: ['Windows','Mac','Linux']
        },
        yAxis: {
            type: 'value',
            min: 0,
            max: 7.5,
            interval: 0.1,
            name: '价格（$）',
        },
        series: [
            {
                data: price,
                type: 'bar',
                showBackground: true,
                backgroundStyle: {
                    color: 'rgba(180, 180, 180, 0.2)'
                }
            }
        ]
    };
    myChart8.setOption(option);
})();

//9--DLC数top5的开发者
(function e9() {
    var myChart9 = echarts.init(document.getElementById('chart9'));

    let developers = [];
    let sum_DLC_count = [];
    <c:forEach items="${top_dlc_developers}" var="mt">
    developers.push("${mt.developers}");
    sum_DLC_count.push(${mt.sum_DLC_count});
    </c:forEach>

    option = {
        title: {
            text: 'DLC数top5的开发者'
        },
        grid: {
            left: '1%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        yAxis: {
            type: 'category',
            axisLabel:{
                interval: 0
            },
            data: developers
        },
        xAxis: {
            type: 'value',
            name: 'DLC数',
        },
        series: [
            {
                data: sum_DLC_count,
                type: 'bar',
                showBackground: true,
                backgroundStyle: {
                    color: 'rgba(180, 180, 180, 0.2)'
                }
            }
        ]
    };
    myChart9.setOption(option);
})();

//10--有支持和无支持服务的游戏的平均玩家数
(function e10() {
    var myChart10 = echarts.init(document.getElementById('chart10'));

    let have_support_time = [];
    let no_support_time = [];
    <c:forEach items="${support}" var="mt">
    have_support_time.push(${mt.have_support_time});
    no_support_time.push(${mt.no_support_time});
    </c:forEach>

    let support = [have_support_time[0],no_support_time[0]]

    option = {
        title: {
            text: '有支持和无支持服务的游戏的平均玩家数'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        xAxis: {
            type: 'category',
            axisLabel:{
                interval: 0
            },
            data: ['有支持服务的游戏','无支持服务的游戏'],
        },
        yAxis: {
            type: 'value',
            name: '平均玩家数量',
        },
        series: [
            {
                data: support,
                type: 'bar',
                showBackground: true,
                backgroundStyle: {
                    color: 'rgba(180, 180, 180, 0.2)'
                }
            }
        ]
    };
    myChart10.setOption(option);
})();





    </script>

</body>

</html>