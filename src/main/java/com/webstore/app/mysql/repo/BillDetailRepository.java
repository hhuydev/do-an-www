package com.webstore.app.mysql.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webstore.app.entity.BillDetail;

@Repository
public interface BillDetailRepository extends JpaRepository<BillDetail, Long> {

  List<BillDetail> findByBillId(Long id);
}
