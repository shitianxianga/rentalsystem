package cn.yd.carrentalsystem.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class UserExample implements Serializable {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andUidIsNull() {
            addCriterion("uid is null");
            return (Criteria) this;
        }

        public Criteria andUidIsNotNull() {
            addCriterion("uid is not null");
            return (Criteria) this;
        }

        public Criteria andUidEqualTo(Integer value) {
            addCriterion("uid =", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotEqualTo(Integer value) {
            addCriterion("uid <>", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThan(Integer value) {
            addCriterion("uid >", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThanOrEqualTo(Integer value) {
            addCriterion("uid >=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThan(Integer value) {
            addCriterion("uid <", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThanOrEqualTo(Integer value) {
            addCriterion("uid <=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidIn(List<Integer> values) {
            addCriterion("uid in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotIn(List<Integer> values) {
            addCriterion("uid not in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidBetween(Integer value1, Integer value2) {
            addCriterion("uid between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotBetween(Integer value1, Integer value2) {
            addCriterion("uid not between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNull() {
            addCriterion("phone is null");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNotNull() {
            addCriterion("phone is not null");
            return (Criteria) this;
        }

        public Criteria andPhoneEqualTo(String value) {
            addCriterion("phone =", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotEqualTo(String value) {
            addCriterion("phone <>", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThan(String value) {
            addCriterion("phone >", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("phone >=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThan(String value) {
            addCriterion("phone <", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThanOrEqualTo(String value) {
            addCriterion("phone <=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLike(String value) {
            addCriterion("phone like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotLike(String value) {
            addCriterion("phone not like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneIn(List<String> values) {
            addCriterion("phone in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotIn(List<String> values) {
            addCriterion("phone not in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneBetween(String value1, String value2) {
            addCriterion("phone between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotBetween(String value1, String value2) {
            addCriterion("phone not between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNull() {
            addCriterion("password is null");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNotNull() {
            addCriterion("password is not null");
            return (Criteria) this;
        }

        public Criteria andPasswordEqualTo(String value) {
            addCriterion("password =", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotEqualTo(String value) {
            addCriterion("password <>", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThan(String value) {
            addCriterion("password >", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("password >=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThan(String value) {
            addCriterion("password <", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThanOrEqualTo(String value) {
            addCriterion("password <=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLike(String value) {
            addCriterion("password like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotLike(String value) {
            addCriterion("password not like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordIn(List<String> values) {
            addCriterion("password in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotIn(List<String> values) {
            addCriterion("password not in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordBetween(String value1, String value2) {
            addCriterion("password between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotBetween(String value1, String value2) {
            addCriterion("password not between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andStateIsNull() {
            addCriterion("state is null");
            return (Criteria) this;
        }

        public Criteria andStateIsNotNull() {
            addCriterion("state is not null");
            return (Criteria) this;
        }

        public Criteria andStateEqualTo(String value) {
            addCriterion("state =", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotEqualTo(String value) {
            addCriterion("state <>", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThan(String value) {
            addCriterion("state >", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThanOrEqualTo(String value) {
            addCriterion("state >=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThan(String value) {
            addCriterion("state <", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThanOrEqualTo(String value) {
            addCriterion("state <=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLike(String value) {
            addCriterion("state like", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotLike(String value) {
            addCriterion("state not like", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateIn(List<String> values) {
            addCriterion("state in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotIn(List<String> values) {
            addCriterion("state not in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateBetween(String value1, String value2) {
            addCriterion("state between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotBetween(String value1, String value2) {
            addCriterion("state not between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andIdcardnumIsNull() {
            addCriterion("idCardNum is null");
            return (Criteria) this;
        }

        public Criteria andIdcardnumIsNotNull() {
            addCriterion("idCardNum is not null");
            return (Criteria) this;
        }

        public Criteria andIdcardnumEqualTo(String value) {
            addCriterion("idCardNum =", value, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumNotEqualTo(String value) {
            addCriterion("idCardNum <>", value, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumGreaterThan(String value) {
            addCriterion("idCardNum >", value, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumGreaterThanOrEqualTo(String value) {
            addCriterion("idCardNum >=", value, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumLessThan(String value) {
            addCriterion("idCardNum <", value, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumLessThanOrEqualTo(String value) {
            addCriterion("idCardNum <=", value, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumLike(String value) {
            addCriterion("idCardNum like", value, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumNotLike(String value) {
            addCriterion("idCardNum not like", value, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumIn(List<String> values) {
            addCriterion("idCardNum in", values, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumNotIn(List<String> values) {
            addCriterion("idCardNum not in", values, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumBetween(String value1, String value2) {
            addCriterion("idCardNum between", value1, value2, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andIdcardnumNotBetween(String value1, String value2) {
            addCriterion("idCardNum not between", value1, value2, "idcardnum");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgIsNull() {
            addCriterion("licenseIImg is null");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgIsNotNull() {
            addCriterion("licenseIImg is not null");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgEqualTo(String value) {
            addCriterion("licenseIImg =", value, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgNotEqualTo(String value) {
            addCriterion("licenseIImg <>", value, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgGreaterThan(String value) {
            addCriterion("licenseIImg >", value, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgGreaterThanOrEqualTo(String value) {
            addCriterion("licenseIImg >=", value, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgLessThan(String value) {
            addCriterion("licenseIImg <", value, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgLessThanOrEqualTo(String value) {
            addCriterion("licenseIImg <=", value, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgLike(String value) {
            addCriterion("licenseIImg like", value, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgNotLike(String value) {
            addCriterion("licenseIImg not like", value, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgIn(List<String> values) {
            addCriterion("licenseIImg in", values, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgNotIn(List<String> values) {
            addCriterion("licenseIImg not in", values, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgBetween(String value1, String value2) {
            addCriterion("licenseIImg between", value1, value2, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andLicenseiimgNotBetween(String value1, String value2) {
            addCriterion("licenseIImg not between", value1, value2, "licenseiimg");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsIsNull() {
            addCriterion("idCardImgs is null");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsIsNotNull() {
            addCriterion("idCardImgs is not null");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsEqualTo(String value) {
            addCriterion("idCardImgs =", value, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsNotEqualTo(String value) {
            addCriterion("idCardImgs <>", value, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsGreaterThan(String value) {
            addCriterion("idCardImgs >", value, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsGreaterThanOrEqualTo(String value) {
            addCriterion("idCardImgs >=", value, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsLessThan(String value) {
            addCriterion("idCardImgs <", value, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsLessThanOrEqualTo(String value) {
            addCriterion("idCardImgs <=", value, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsLike(String value) {
            addCriterion("idCardImgs like", value, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsNotLike(String value) {
            addCriterion("idCardImgs not like", value, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsIn(List<String> values) {
            addCriterion("idCardImgs in", values, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsNotIn(List<String> values) {
            addCriterion("idCardImgs not in", values, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsBetween(String value1, String value2) {
            addCriterion("idCardImgs between", value1, value2, "idcardimgs");
            return (Criteria) this;
        }

        public Criteria andIdcardimgsNotBetween(String value1, String value2) {
            addCriterion("idCardImgs not between", value1, value2, "idcardimgs");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}