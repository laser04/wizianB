<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        body{
            background-color: #F2F3F5;
        }
        .container-table .form-select:focus,
        .container-table .form-control:focus{
            box-shadow: none;
            border-color: #9a9a9a;
        }

        /* 과정 검색 */
        .tableSearch{
            font-weight: 600;
        }

        /* 검색 결과 수 */
        .searchResult .subTitle{
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 0;
        }
        .searchResult .subResult{
            font-size: 14px;
            margin-bottom: 0;
        }
        .searchResult select.form-select{
            padding: 0.2rem 1.25rem 0.2rem 0.75rem;
        }


        /* 과정 정보 테이블 */
        .nthInfoResponsive{
            overflow-x: auto;
        }
        .nthInfoContainer{
            min-width: 1220px;
            cursor: pointer;
        }
        .nthInfoContainer .d-flex{
            border-bottom:1px solid #E1E1E1;
        }
        .nthInfoContainer .d-flex div:nth-child(n+2){
            height: 44px;
            border-left: 1px solid #E1E1E1;
            padding: 10px 0;
        }
        .nthInfoContainer .d-flex .chkBox,
        .nthInfoContainer .d-flex .chkBox input[type='checkbox']{
            height: 44px;
            border:none;
        }

        .nthInfoContainer .th{
            background-color: #EFEFEF;
            font-weight: 600;
        }
        .container-table .tr,
        .nthInfoContainer .d-flex.td:nth-child(even){
            background-color: #fff;
        }
        .nthInfoContainer .d-flex.td:nth-child(odd){
            background-color: rgba(0,0,0,0);
        }
        .nthInfoContainer .d-flex.td:not(.tdBg) :nth-child(n):hover{
            background-color: #D1D1D1;
            font-weight: 600;
            color: #245396;
        }

        /* 체크 박스 선택 시 css */
        .nthInfoContainer .d-flex.tdChk{
            background-color: #D1D1D1 !important;
        }
        /* row 선택 시 focus css */
        .nthInfoContainer .d-flex.tdBg{
            background-color: #F2F7FF !important;
            border: 1px solid #245396 !important;
            font-weight: 600;
            color: #245396;
        }


        /* 페이징 */
        .pagination ul {
            margin: 15px 0;
            border: none;
            padding: 0;
        }
        .pagination ul li{
            display: inline-block;
            border: none;
            width: 25px;
            height: 25px;
            padding: 0;
        }
        .pagination ul li.active{
            background-color: #f5f5f5;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
            color: #245396;
        }
        .pagination ul li:not(.active):hover{
            background-color: #e1e1e1;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
        }
        .pagination .pageLoc {
            margin: 0 10px 0 0;
            color: #797676;
        }

        /* 그리드 custom css */

        /* 스크롤 자투리 부분 색 변경 */
        .tui-grid-scrollbar-left-bottom,
        .tui-grid-scrollbar-right-bottom,
        .tui-grid-scrollbar-right-top{
            background-color: #fff;
        }

        .tui-grid-cell-current-row td{
            background-color: #F2F7FF !important;
            font-weight: 600;
            color: #245396;
        }
    </style>
</head>

<body>
    <div class="container-table m-2">
        <%--TOP--%>
        <div class="col-12">
            <div class="d-flex flex-row py-3 px-5 border border-gray-100 rounded-2 align-items-center tr">
                <div class="col-2 align-middle tableSearch">수강년도/분기</div>
                <div class="col-1 me-1"><input type="text" class="form-control"></div>
                <div class="col-1 me-2">
                    <select class="form-select">
                        <option selected>1분기</option>
                        <option>2분기</option>
                        <option>3분기</option>
                        <option>4분기</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정구분</div>
                <div class="col-2 me-2">
                    <select class="form-select">
                        <option selected>Java</option>
                        <option>Python</option>
                        <option>C++</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정명</div>
                <div class="col-2"><input type="text" class="form-control"></div>
            </div>
        </div>

        <%--HEAD--%>
        <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
            <div class="col-3 d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">모집기수정보</p>
                <p class="subResult text-secondary me-2">검색결과:00건</p>
                <div>
                    <select class="form-select">
                        <option selected>5</option>
                        <option>30</option>
                        <option>50</option>
                        <option>70</option>
                        <option>100</option>
                    </select>
                </div>
            </div>
        </div>

        <%--BODY--%>
        <div class="nthInfoTable text-center border border-gray-100 rounded-2">
            <div id="nthTable"></div>

            <%-- 페이징 --%>
            <div class="pagination d-flex flex-row justify-content-center text-center position-relative tr">
                <ul>
                    <li class="active">1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                    <li>7</li>
                    <li>8</li>
                    <li>9</li>
                    <li>10</li>
                    <li>></li>
                    <li>>></li>
                </ul>

                <div class="position-absolute top-50 end-0 translate-middle-y">
                    <p class="pageLoc">현재:1/전체:14(1~5)</p>
                </div>
            </div>
        </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const data = [
            {
                CORS_DIV: 'JAVA',
                SEL_NM: '자바과정 풀스택',
                NTH_NM: '3',
                ENT_YR: '2023',
                TERM_DIV: '1',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                YR_CNT: '6',
                NOTE: '기수 비고 1'
            },
            {
                CORS_DIV: 'Python',
                SEL_NM: '파이썬',
                NTH_NM: '2',
                ENT_YR: '2023',
                TERM_DIV: '1',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                YR_CNT: '6',
                NOTE: '기수 비고 2'
            },
            {
                CORS_DIV: 'C++',
                SEL_NM: 'C++ 코딩테스트',
                NTH_NM: '4',
                ENT_YR: '2023',
                TERM_DIV: '1',
                EDU_ST_DT: '2023-08-01',
                EDU_END_DT: '2023-08-01',
                YR_CNT: '6',
                NOTE: '기수 비고 3'
            }
        ];
        function educationPeriodFormatter({row}) {
            const startDate = row.EDU_ST_DT;
            const endDate = row.EDU_END_DT;
            return startDate + "~" + endDate;
        }
        const nthTable = new tui.Grid({
            el: document.getElementById('nthTable'),
            data: data,
            rowHeaders: ['checkbox'],
            pagination: true,
            scrollX: true,
            scrollY: true,
            columns: [
                {
                    header: '과정구분',
                    name: 'CORS_DIV',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '과정명',
                    name: 'SEL_NM',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '기수',
                    name: 'NTH_NM',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '수강년도',
                    name: 'ENT_YR',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '분기',
                    name: 'TERM_DIV',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '교육시작일',
                    name: 'EDU_ST_DT',
                    sortingType: 'asc',
                    sortable: true, align: 'center',
                },
                {
                    header: '교육종료일',
                    name: 'EDU_END_DT',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '수업개월수',
                    name: 'YR_CNT',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '비고',
                    name: 'NOTE',
                    sortingType: 'asc',
                    sortable: false, align: 'center'
                }
            ],
            columnOptions: {
                resizable: true
            },
            draggable: true,
        });
        const nthTheme = new tui.Grid.applyTheme('default', {
            cell: {
                normal: {
                    background: '#fff',
                    border: '#E1E1E1',
                    showVerticalBorder: true
                },
                header: {
                    background: '#EFEFEF',
                    border: '#E1E1E1'
                },
                rowHeader: {
                    background: '#EFEFEF',
                    border: '#E1E1E1'
                }
                ,
                evenRow: {
                    background: '#F2F3F5',
                    border: '#000'
                },
                oddRow: {
                    background: '#FFF',
                    border: '#000'
                }
            }
        });
    });

    // 신규 버튼 click
    document.getElementById("insertBtn").addEventListener("click", function () {
        const rowData = [
            {
                CORS_DIV: 'NEW_CORS_DIV',
                SEL_NM: 'NEW_SEL_NM',
                NTH_NM: 'NEW_NTH_NM',
                ENT_YR: 'NEW_ENT_YR',
                TERM_DIV: 'NEW_TERM_DIV',
                EDU_ST_DT: 'NEW_EDU_ST_DT',
                EDU_END_DT: 'NEW_EDU_END_DT',
                YR_CNT: 'NEW_YR_CNT',
                NOTE: 'NEW_NOTE'
            }
        ];
        var rowKey = nthTable.getFocusedCell()['rowKey'];
        nthTable.appendRow(rowData[0], {
            at: idx = nthTable.getIndexOfRow(rowKey)+1,
            extendPrevRowSpan: true,
            focus: true
        });
        nthData = nthTable.getData();
        // 하단 table 초기화
        var tableInput = document.querySelectorAll("#inputTable .tableInput");
        document.querySelector("#inputTable tbody").setAttribute("id", "row"+rowKey);
        tableInput.forEach((ti) => {
            ti.value = "";
        });


        // 하단 table 데이터 넣기
        function rowDataLoad(rowKey, table, id){
            var datas = table.getRow(rowKey);
            var tableInput = document.querySelectorAll("#"+id+" .tableInput");
            if(datas == null ) {        // 데이터 x
                tableInput.forEach((ti) => {
                    ti.value = "";
                });
            }else{
                tableInput.forEach((ti) => {
                    var tiName = ti.getAttribute("name");
                    if(tiName==="CORS_DIV" || tiName==="CORS_DIV"){
                        $('select[name='+tiName+']').val(datas[tiName]).prop("selected",true);
                    }
                    ti.value = datas[tiName];
                });
            }
        }
    });
</script>
</body>
</html>
