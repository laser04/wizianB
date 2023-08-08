<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp" %>
<html>
<head>
    <title>Title</title>
    <style>
        .breadcrumbs ul,
        .menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .page-title {
            font-size: 36px;
            font-weight: 600;
        }

        .breadcrumbs ul li {
            display: inline-block;
        }

        .menu ul li a {
            display: inline-block;
            color: #646464;
            padding: 10px;
            font-weight: 600;
        }

        .menu ul li a.active {
            color: #003A78;
        }

        .title {
            font-size: 18px;
            font-weight: 600;
        }

        .table tr :nth-child(n+2) {
            width: 83px;
        }

        .table tbody tr td:nth-child(n+2) {
            text-align: center;
        }

        #application_div {
            border: none;
        }

        #application_div:focus {
            outline: none;
            box-shadow: none;
        }

        #application_member {
            font-weight: 600;
        }

        #application_member .member_id {
            color: #f00;
        }

        #application_btn .btn {
            margin: 0 2px;
            padding: 10px 15px;
        }
    </style>
</head>
<body>
<div class="my-5 container h-100">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">지원서확인</p>
            <div class="breadcrumbs">
                <ul>
                    <li>홈</li>
                    <li>마이페이지</li>
                    <li>지원서확인</li>
                </ul>
            </div>
        </div>
        <div>
            <div></div>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-3 mb-3">
            <div class="menu h-auto px-3 border rounded-3">
                <ul>
                    <li class="py-2 border-bottom border-gray-100">
                        <a href="/apply2" class="active">지원서확인</a>
                    </li>
                    <li class="py-2">
                        <a href="/apply">추가제출서류</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-lg-9">
            <div class="mb-3">
                <select id="application_div" class="form-select border-bottom border-dark rounded-0 border-2 fw-bold"
                        aria-label="select_list">
                    <option selected>자바기반 풀스택 개발자 취업과정</option>
                </select>
            </div>
            <h3 class="title mt-5 mb-1">추가제출서류</h3>
            <div class="border-top border-dark border-2">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr class="table-light text-center">
                        <th>제출서류</th>
                        <th>기관명</th>
                        <th>첨부파일</th>
                    </tr>
                    </thead>
                    <%-- 반복 start --%>
                    <tbody>
                    <tr>
                        <td>지원서(가림A형)</td>
                        <td></td>
                        <td>
                            <input type="text">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>지원서(필기용)</td>
                        <td></td>
                        <td>
                            <input type="text">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>지원서(가림B형)</td>
                        <td></td>
                        <td>
                            <input type="text">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>학위증명서</td>
                        <td></td>
                        <td>
                            <input type="text">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>활동이력증명</td>
                        <td></td>
                        <td>
                            <input type="text">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>필기고사답안지</td>
                        <td></td>
                        <td>
                            <input type="text">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>지원서(보관용)</td>
                        <td></td>
                        <td>
                            <input type="text">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>지원서(보관용)</td>
                        <td></td>
                        <td>
                            <input type="text">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>지원서(필기용)</td>
                        <td></td>
                        <td>
                            <input type="text">
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">업로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">다운로드</button>
                            <button type="button" class="btn btn-sm btn-light btn-outline-dark">삭제</button>
                        </td>
                    </tr>

                    </tbody>
                    <%-- 반복 end --%>
                </table>

                <%-- Buttons --%>
                <div id="application_btn" class="d-flex justify-content-center mt-4">
                    <button type="button" class="btn btn-primary">이전</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>
