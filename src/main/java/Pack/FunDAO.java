package Pack;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

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

    void select(String mapper) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                List<Integer> mm = session.selectList(mapper);
                for (Integer item : mm) {
                    System.out.print(item + " ");
                }
                System.out.println();
                return 0;
            }
        });
    }

    void insert(final int num, String mapper) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.insert(mapper, num);
            }
        });
    }

    void delete(final int num, String mapper) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.delete(mapper, num);
            }
        });
    }

    void update(final int num, String mapper) {
        Proxy.command(this, new Delegate() {
            public int delegate(SqlSession session) {
                return session.update(mapper, num);
            }
        });
    }
}

//public class FunDAO {
//    public static void main(String[] args) {
//        UserDao userdao = new UserDao();
//        userdao.select();
//    }
//}