# README: Stored Procedures & Views (Dependencies + Grouping)

This document lists all **stored procedures (SP)** and **views** defined in this repository and groups them into:

- **Statistic** (reporting/views used for dashboards)
- **CRUD** (stored procedures used to insert/update/delete data)

It also documents **dependencies**: which tables/views/SP are referenced.

> Note: some SP names/objects exist in multiple files (e.g., one set for HR and one for employee). This README focuses only on objects present in the SQL files under `DB/`.

---

## Legend

- **Depends on tables/views**: objects referenced in SQL `FROM`, `JOIN`, `SELECT`, etc.
- **Calls**: stored procedures invoked inside another stored procedure.
- **Writes to**: tables modified by `INSERT/UPDATE/DELETE`.

---

## A) STATISTIC (Views)

### 1) Employee profile / HR management views

#### `VW_LAY_DS_VIENCHUC`
- **Purpose**: “full employee profile listing”
- **Depends on**: `VIENCHUC`, `DANTOC`, `TONGIAO`, `TRINHDOHOCVAN`, `CO_CHUCVU`, `COQUAN`, `CHUCVU`
- **Joins**: left joins for most master attributes; uses `CO_CHUCVU` to link to department/unit and `CHUCVU` for position.

#### `VW_DS_CONGTAC`
- **Purpose**: HR “work information”
- **Depends on**: `CO_CHUCVU`, `VIENCHUC`, `CHUCVU`, `COQUAN`, `CHUCDANH_NGHENGHIEP`
- **Joins**: inner joins.

#### `VW_ThongKeNhanSu`
- **Purpose**: HR “employee statistics by unit/unit+gender+ethnicity+religion”
- **Depends on**: `VIENCHUC`, `DANTOC`, `TONGIAO`, `CO_CHUCVU`, `COQUAN`
- **Aggregation**: `COUNT(DISTINCT vc.MAVIENCHUC)`
- **Group by**: `cq.TENCOQUAN, vc.GIOITINH, dt.TENDANTOC, tg.TENTONGIAO`

#### `VW_KHENTHUONG`
- **Purpose**: HR reward history rows for an employee
- **Depends on**: `DUOC_KHENTHUONG`, `VIENCHUC`, `HINHTHUCKHENTHUONG`

#### `VW_KYLUAT`
- **Purpose**: HR discipline history rows for an employee
- **Depends on**: `BI_KYLUAT`, `VIENCHUC`, `HINHTHUCKYLUAT`

---

### 2) Admin/Thanh tra statistic views

These views are described in `DB/04_DB_Thongke_view.sql` and/or the statistic section of it.

#### `VW_THONGKE_GIOITINH`
- **Depends on**: `VIENCHUC`
- **Aggregation**: `COUNT(*)`
- **Group by**: `GIOITINH`

#### `VW_THONGKE_DANTOC`
- **Depends on**: `VIENCHUC`, `DANTOC`
- **Aggregation**: `COUNT(*)`
- **Group by**: `dt.TENDANTOC`

#### `VW_THONGKE_TONGIAO`
- **Depends on**: `VIENCHUC`, `TONGIAO`
- **Aggregation**: `COUNT(*)`
- **Group by**: `tg.TENTONGIAO`
- **Join type**: `LEFT JOIN` to allow missing religion code.

#### `VW_THONGKE_DOTUOI`
- **Depends on**: `VIENCHUC`
- **Derivation**: bucket by age using `TIMESTAMPDIFF(YEAR, NGAYSINH, CURDATE())`
- **Aggregation**: `COUNT(*)`
- **Group by**: `NHOMTUOI` (computed case)

#### `VW_THONGKE_TRINHDOHOCVAN`
- **Depends on**: `VIENCHUC`, `TRINHDOHOCVAN`
- **Aggregation**: `COUNT(*)`
- **Group by**: `td.TRINHDONGHIEPVUCHUYENNGANH`

#### `VW_THONGKE_CHUYENMON`
- **Depends on**: `CO_TRDCM_CAONHAT`, `CHUYENMON`
- **Aggregation**: `COUNT(*)`
- **Group by**: `cm.TENCHUYENMON`

#### `VW_THONGKE_NGOAINGU`
- **Depends on**: `CO_TRD_NGOAINGU`, `NGOAINGU`
- **Aggregation**: `COUNT(*)`
- **Group by**: `nn.TENNGOAINGU`

#### `VW_THONGKE_TINHOC`
- **Depends on**: `CO_TRD_TINHOC`, `CHUNGCHITINHOC`
- **Aggregation**: `COUNT(*)`
- **Group by**: `th.CHUNGCHITINHOC`

#### `VW_THONGKE_COQUAN`
- **Depends on**: `CO_CHUCVU`, `COQUAN`
- **Aggregation**: `COUNT(DISTINCT ccv.MAVIENCHUC)`
- **Group by**: `cq.TENCOQUAN`

#### `VW_THONGKE_CHUCVU`
- **Depends on**: `CO_CHUCVU`, `CHUCVU`
- **Aggregation**: `COUNT(*)`
- **Group by**: `cv.TENCHUCVU`

#### `VW_THONGKE_NGHENGHIEP`
- **Depends on**: `CO_CHUCVU`, `CHUCDANH_NGHENGHIEP`
- **Aggregation**: `COUNT(*)`
- **Group by**: `nn.TENNGHENGHIEP`

#### `VW_THONGKE_KHENTHUONG`
- **Depends on**: `DUOC_KHENTHUONG`, `HINHTHUCKHENTHUONG`
- **Aggregation**: `COUNT(*)`
- **Group by**: `ht.TENHINHTHUCKHENTHUONG`

#### `VW_THONGKE_KYLUAT`
- **Depends on**: `BI_KYLUAT`, `HINHTHUCKYLUAT`
- **Aggregation**: `COUNT(*)`
- **Group by**: `kl.TENHINHTHUCKYLUAT`

#### `VW_THONGKE_KHENTHUONG_THEONAM`
- **Depends on**: `DUOC_KHENTHUONG`
- **Aggregation**: `COUNT(*)`
- **Group by**: `YEAR(NAMNHANKHENTHUONG)`

#### `VW_THONGKE_KYLUAT_THEONAM`
- **Depends on**: `BI_KYLUAT`
- **Aggregation**: `COUNT(*)`
- **Group by**: `YEAR(NAMBIKYLUAT)`

#### `VW_THONGKE_TUYENDUNG_THEONAM`
- **Depends on**: `VIENCHUC`
- **Aggregation**: `COUNT(*)`
- **Group by**: `YEAR(NGAYTUYENDUNG)`

#### `VW_DASHBOARD_TONGQUAN`
- **Purpose**: top-level dashboard counters
- **Depends on**: `VIENCHUC`, `DUOC_KHENTHUONG`, `BI_KYLUAT`
- **Aggregation logic**: scalar subqueries counting total employees, gender counts, and distinct people receiving reward/discipline.

#### `VW_THONGKE_TINHTRANGSUCKHOE`
- **Depends on**: `CO_TINHTRANGSK`, `TINHTRANGSUCKHOE`
- **Aggregation**: `COUNT(*)`
- **Group by**: `sk.TINHTRANGSUCKHOE`

---

## B) CRUD (Stored Procedures)

Stored procedures are grouped here by module. Dependency notes include which tables are written and which other SPs are called.

---

### 1) App user/role management

#### `SP_THEM_USERS(p_mavienchuc, p_role)`
- **Writes to**: `USERS`
- **Also executes dynamic SQL**:
  - `CREATE USER ...`
  - `GRANT ...`
  - `SET DEFAULT ROLE ...`
- **Depends on**: `USERS` (to map ROLE → db role name)

#### `SP_CAPNHAT_USERS(p_mavienchuc, p_role)`
- **Writes to**: `USERS.ROLE`
- **Also executes dynamic SQL**:
  - `REVOKE` old DB role
  - `GRANT` new DB role
  - `SET DEFAULT ROLE`
- **Depends on**: `USERS` (reads old role first)

#### `SP_XOA_USERS(p_mavienchuc)`
- **Writes to**: `USERS` (delete row)
- **Also executes dynamic SQL**:
  - `DROP USER IF EXISTS ...`

---

### 2) CRUD for employee (core record)

#### `SP_THEM_VIENCHUC(...)`
- **Writes to**: `VIENCHUC`
- **Calls**: `SP_THEM_USERS(p_MAVIENCHUC, p_role)`
- **Transaction**: yes (`START TRANSACTION` / `COMMIT`)

#### `SP_CAPNHAT_VIENCHUC(...)`
- **Writes to**: `VIENCHUC` (update all fields)
- **Calls**: `SP_CAPNHAT_USERS(p_MAVIENCHUC, p_role)`
- **Transaction**: yes

#### `SP_XOA_VIENCHUC(p_MAVIENCHUC)`
- **Calls**: `SP_XOA_USERS(p_MAVIENCHUC)`
- **Writes to**: `VIENCHUC` (delete row)
- **Transaction**: yes

---

### 3) CRUD for employee details (HR module)

These procedures mostly **upsert** (via `ON DUPLICATE KEY UPDATE`) or **delete** from relationship/detail tables.

#### Rewards
- `SP_CAPNHAT_DUOC_KHENTHUONG(p_MAHINHTHUCKHENTHUONG, p_MAVIENCHUC, ...)`
  - **Writes to**: `DUOC_KHENTHUONG` (upsert)
- `SP_XOA_DUOC_KHENTHUONG(p_MAHINHTHUCKHENTHUONG, p_MAVIENCHUC)`
  - **Writes to**: `DUOC_KHENTHUONG` (delete)

#### Discipline
- `SP_CAPNHAT_BI_KYLUAT(p_MAHINHTHUCKYLUAT, p_MAVIENCHUC, ...)`
  - **Writes to**: `BI_KYLUAT` (upsert)
- `SP_XOA_BI_KYLUAT(p_MAHINHTHUCKYLUAT, p_MAVIENCHUC)`
  - **Writes to**: `BI_KYLUAT` (delete)

#### Political theory level (`CO_CAPLYLUANCHINHTRI`)
- `SP_CAPNHAT_CO_CAPLYLUANCHINHTRI(p_MACAPCT, p_MAVIENCHUC)` → upsert
- `SP_XOA_CO_CAPLYLUANCHINHTRI(p_MACAPCT, p_MAVIENCHUC)` → delete

#### State management (`CO_CAPQUANLYNHANUOC`)
- `SP_CAPNHAT_CO_CAPQUANLYNHANUOC(p_MACAPQLNN, p_MAVIENCHUC)` → upsert
- `SP_XOA_CO_CAPQUANLYNHANUOC(p_MACAPQLNN, p_MAVIENCHUC)` → delete

#### Position assignment (`CO_CHUCVU`)
- `SP_CAPNHAT_CO_CHUCVU(p_MAVIENCHUC, p_MACHUCVU, p_MACOQUAN, p_MANGHENGHIEP, p_THOIGIANGIUCHUCVU, p_THOIGIANKETTHUCCHUCVU)`
  - **Writes to**: `CO_CHUCVU` (upsert)
- `SP_XOA_CO_CHUCVU(p_MAVIENCHUC, p_MACHUCVU, p_MACOQUAN, p_MANGHENGHIEP)`
  - **Writes to**: `CO_CHUCVU` (delete)

#### Salary coefficient (`CO_HESOLUONG`)
- `SP_CAPNHAT_CO_HESOLUONG(p_MABACLUONG, p_MANHOMNGACH, p_MACHITIETLUONG, p_HESOLUONG)` → upsert
- `SP_XOA_CO_HESOLUONG(p_MABACLUONG, p_MANHOMNGACH, p_MACHITIETLUONG)` → delete

#### Address details
- Permanent residence (`CO_HOKHAUTHUONGTRU`)
  - `SP_CAPNHAT_CO_HOKHAUTHUONGTRU(...)` / `SP_XOA_CO_HOKHAUTHUONGTRU(...)`
- Temporary residence (`CO_TAMTRU`)
  - `SP_CAPNHAT_CO_TAMTRU(...)` / `SP_XOA_CO_TAMTRU(...)`

#### Health status (`CO_TINHTRANGSK`)
- `SP_CAPNHAT_CO_TINHTRANGSK(...)` → upsert
- `SP_XOA_CO_TINHTRANGSK(...)` → delete

#### Highest professional qualification (`CO_TRDCM_CAONHAT`)
- `SP_CAPNHAT_CO_TRDCM_CAONHAT(p_MACHUYENMON, p_MAVIENCHUC)`
- `SP_XOA_CO_TRDCM_CAONHAT(p_MACHUYENMON, p_MAVIENCHUC)`

#### Foreign language (`CO_TRD_NGOAINGU`)
- `SP_CAPNHAT_CO_TRD_NGOAINGU(p_MANGOAINGU, p_MAVIENCHUC)`
- `SP_XOA_CO_TRD_NGOAINGU(p_MANGOAINGU, p_MAVIENCHUC)`

#### Computer skill (`CO_TRD_TINHOC`)
- `SP_CAPNHAT_CO_TRD_TINHOC(p_MACHUNGCHITINHOC, p_MAVIENCHUC)`
- `SP_XOA_CO_TRD_TINHOC(p_MACHUNGCHITINHOC, p_MAVIENCHUC)`

#### Military service (`THUOC_QUANDOI`)
- `SP_CAPNHAT_THUOC_QUANDOI(p_MAVIENCHUC, p_MATTD_QD, p_MAQUANHAM, p_NGAYNHAPNGU, p_NGAYXUATNGU, p_NOINHAPNGU)`
- `SP_XOA_THUOC_QUANDOI(p_MAVIENCHUC, p_MATTD_QD, p_MAQUANHAM)`

#### Political-social organization membership (`THUOC_TOCHUCDOANTHECHINHTRIXAHOI`)
- `SP_CAPNHAT_THUOC_TCDT_CTXH(...)`
- `SP_XOA_THUOC_TCDT_CTXH(...)`

#### Recruitment (`TUYENDUNG`)
- `SP_CAPNHAT_TUYENDUNG(p_MANGHENGHIEP, p_MAVIENCHUC, p_MACOQUAN, p_NGAYTUYENDUNG)`
- `SP_XOA_TUYENDUNG(p_MANGHENGHIEP, p_MAVIENCHUC, p_MACOQUAN)`

#### Commune/ward master (`XAPHUONG`)
- `SP_CAPNHAT_XAPHUONG(p_MAXAPHUONG, p_MATINHTHANH, p_TENXAPHUONG)`
- `SP_XOA_XAPHUONG(p_MAXAPHUONG)`

#### Salary group for benefit (`THUOC_NHOM_NGACH`)
- `SP_CAPNHAT_THUOC_NHOMNGACH(p_MAVIENCHUC, p_MACHITIETLUONG, p_THOIGIANBATDAUHUONG)`
- `SP_XOA_NHOMNGACH(p_MAVIENCHUC, p_MACHITIETLUONG)`

---

### 4) Employee self-service views via procedures (read-only SPs)

Even though these are `SELECT` procedures, they are used by the “employee view/dashboard” flows. They are not CRUD (no writes), but they are still part of the SP layer.

#### `SP_CANHAN_THONGTIN()`
- **Depends on**: `USERS` (to resolve current user’s `MAVIENCHUC`), `VW_LAY_DS_VIENCHUC`

#### `SP_VIENCHUC_LICHSU_CONGTAC()`
- **Depends on**: `USERS`, `VW_DS_CONGTAC`
- **Order logic**: active record last date handling: `THOIGIANKETTHUCCHUCVU IS NULL` is prioritized.

#### `SP_VIENCHUC_KHENTHUONG()`
- **Depends on**: `USERS`, `DUOC_KHENTHUONG`, `HINHTHUCKHENTHUONG`

#### `SP_VIENCHUC_KYLUAT()`
- **Depends on**: `USERS`, `BI_KYLUAT`, `HINHTHUCKYLUAT`

#### `SP_VIENCHUC_BANG()`
- **Depends on**: `USERS`, `CO_TRDCM_CAONHAT` + `CHUYENMON`, `CO_TRD_NGOAINGU` + `NGOAINGU`, `CO_TRD_TINHOC` + `CHUNGCHITINHOC`
- **Aggregation logic**: `UNION ALL` across the 3 kinds of certificates.

#### `SP_VIENCHUC_DASHBOARD()`
- **Depends on**: `USERS`, `VW_LAY_DS_VIENCHUC`, `VW_DS_CONGTAC`, `VW_KHENTHUONG`, `VW_KYLUAT`

---

### 5) HR statistic helper SPs (dynamic filtering)

These are query/SP helpers used for HR “statistic list” pages.

#### `SP_DASHBOARD_CHITIET_NHANSU(...)`
- **Depends on**: `VIENCHUC`, `CO_TINHTRANGSK`, `TINHTRANGSUCKHOE`, `CO_CHUCVU`, `COQUAN`, `CHUCVU`, `DUOC_KHENTHUONG`, `BI_KYLUAT`
- **Purpose**: filter a list by optional parameters (health, age group, unit, position, gender, reward year, discipline year)

#### `SP_LAY_DANH_SACH_THEO_CHI_SO(p_Category, p_Value)`
- **Purpose**: dynamic SQL filter by category
- **Depends on**:
  - Category `suckhoe`: `VIENCHUC`, `CO_TINHTRANGSK`, `TINHTRANGSUCKHOE`
  - Category `dotuoi`: `VIENCHUC`
  - Category `khenthuong`: `VIENCHUC`, `DUOC_KHENTHUONG`, `HINHTHUCKHENTHUONG`
  - Category `kyluat`: `VIENCHUC`, `BI_KYLUAT`, `HINHTHUCKYLUAT`
  - Category `gioitinh`: `VIENCHUC`
- **Implementation detail**: builds SQL string into `@sql` and executes via `PREPARE ... EXECUTE`.

---

## C) Quick dependency map (summary)

- **Central table**: `VIENCHUC`
- **Core relationships** used by reporting views:
  - `CO_CHUCVU` joins to `COQUAN`, `CHUCVU`, `CHUCDANH_NGHENGHIEP`
  - `DUOC_KHENTHUONG` joins to `HINHTHUCKHENTHUONG`
  - `BI_KYLUAT` joins to `HINHTHUCKYLUAT`
- **Employee read SPs** rely on views:
  - `VW_LAY_DS_VIENCHUC`, `VW_DS_CONGTAC`, `VW_KHENTHUONG`, `VW_KYLUAT`
