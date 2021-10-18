package Pack;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

interface Delegate {
    int delegate(SqlSession session);
}

class Proxy {
    static void command(FunDAO dao, Delegate d) {
        SqlSession session = dao.ssf.openSession();
        try {
            if (d.delegate(session) > 0)
                session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}

class FunDAO {
    SqlSessionFactory ssf;

    FunDAO() {
        try {
            InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
            ssf = new SqlSessionFactoryBuilder().build(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //*****************************************송용민
    List<Map<String, String>> searching(String mapper, String id) {
        SqlSession session = ssf.openSession();
        List<Map<String, String>> mm = session.selectList(mapper, id);

        session.close();

        return mm;
    }

    List<Map<String, String>> select(String mapper) {
        SqlSession session = ssf.openSession();
        List<Map<String, String>> mm = session.selectList(mapper);

        session.close();

        return mm;
    }

    //*************************************채송화
    int select_mem(String mapper, memberBean memberBean) {
        SqlSession session = this.ssf.openSession();
        int count = session.selectOne(mapper, memberBean);
        return count;
    }

    int select_adm(String mapper, adminBean adminBean) {
        SqlSession session = this.ssf.openSession();
        int count = session.selectOne(mapper, adminBean);
        return count;
    }

    String find(String mapper, memberBean memberBean) {
        SqlSession session = this.ssf.openSession();
        return session.selectOne(mapper, memberBean);
    }

    List<memberBean> mem_search(String mapper, memberBean memberBean) {
        SqlSession session = this.ssf.openSession();
        List<memberBean> m = session.selectList(mapper, memberBean);
        return m;
    }

    List<bookBean> select(String mapper, SearchBean param) {
        SqlSession session = this.ssf.openSession();

        List<bookBean> mm = session.selectList(mapper, param);
        return mm;
    }

    //********************************************김민건
    List<bookBean> select(String mapper, bookBean bB) { //민건 대출화면 select
        SqlSession session = this.ssf.openSession();
        List<bookBean> mm = session.selectList(mapper, bB);
        return mm;
    }

    List<bookBean> select(String mapper, rentBean rentBean) {
        SqlSession session = this.ssf.openSession();

        List<bookBean> mm = session.selectList(mapper, rentBean);
        return mm;
    }
//    void select(String mapper, String id) {
//        Proxy.command(this, new Delegate() {
//            public int delegate(SqlSession session) {
//                List<Map<String, String>> mm = session.selectList(mapper, id);
//                memberBean member = new memberBean();
//                for (Map<String, String> item : mm) {
//                	member.setMem_id(item.get("mem_id"));
//                    System.out.print(item.get("mem_id") + " ");
//                    System.out.print(item.get("mem_name") + " ");
//                    System.out.print(item.get("mem_reg") + " ");
//                    System.out.print(item.get("mem_tel") + " ");
//                    System.out.println();
//                }
//                System.out.println();
//                System.out.println(member.getMem_id());
//                return 0;
//            }
//        });
//    }

    void insert(String mapper, memberBean bean) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.insert(mapper, bean);
            }
        });
    }

    void insert(String mapper, bookBean bookBean) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.insert(mapper, bookBean);
            }
        });
    }

    void insert(String mapper, rentBean rb) { //민건 rent대여 insert
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.insert(mapper, rb);
            }
        });
    }

    void delete(String mapper, memberBean bean) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.delete(mapper, bean);
            }
        });
    }

    void delete(String mapper, rentBean rb) { //민건 rent대여시 예약목록 삭제
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.delete(mapper, rb);
            }
        });
    }

    void update(String mapper, memberBean bean) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                System.out.println(bean.getMem_cnt());
                return session.update(mapper, bean);
            }
        });
    }

    void update(String mapper, bookBean BookBean) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.update(mapper, BookBean);
            }
        });
    }

    void update(String mapper, rentBean rb) { //민건 return반납시 rent테이블 tf 0으로 만듬
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.update(mapper, rb);
            }
        });
    }

    void delete(String mapper, reserveBean rb) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.delete(mapper, rb);
            }
        });
    }

    List<reserveBean> select(String mapper, String param) {
        SqlSession session = this.ssf.openSession();
        List<reserveBean> mm = session.selectList(mapper, param);
        return mm;
    }

    void delete(String mapper, String param) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.delete(mapper, param);
            }
        });
    }

    int selectUser(String mapper, String param) {
        SqlSession session = this.ssf.openSession();
        int count = session.selectOne(mapper, param);
        return count;
    }
}

//public class FunDAO {
//    public static void main(String[] args) {
//        UserDao userdao = new UserDao();
//        userdao.select();
//    }
//}