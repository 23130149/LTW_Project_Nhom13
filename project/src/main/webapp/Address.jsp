<main class="about-us-container">

  <h1>Sổ địa chỉ</h1>

  <div class="profile-box">

    <c:choose>
      <c:when test="${empty addressList}">
        <p>Bạn chưa có địa chỉ nào.</p>
      </c:when>

      <c:otherwise>
        <ul class="address-list">
          <c:forEach var="addr" items="${addressList}">
            <li class="address-item">
              <p>${addr.fullAddress}</p>
              <span>${addr.phone}</span>
            </li>
          </c:forEach>
        </ul>
      </c:otherwise>
    </c:choose>

    <div class="profile-actions">
      <a href="#" class="btn-save">Thêm địa chỉ mới</a>
    </div>

  </div>

</main>
