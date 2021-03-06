package bitfire.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import bitfire.model.User;
import bitfire.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public User getUser(int id) {
		return entityManager.find(User.class, id);
	}

	@Override
	@Transactional
	public User saveUser(User user) {
		return entityManager.merge(user);
	}

	@Override
	public User getUserByUsername(String username) {
        String query = "from User user left join fetch user.roles "
                + "where lower(username) = :username";

            List<User> users = entityManager.createQuery( query, User.class )
                .setParameter( "username", username.toLowerCase() )
                .getResultList();
            
//            System.out.println("ROLE IS: " + users.get( 0 ).getRoles().iterator().next());
            return users.size() == 0 ? null : users.get( 0 );
	}

	@Override
	public List<User> getUsers() {
		
		String query="from User u where 'ROLE_USER' IN elements(u.roles) ";
		return entityManager.createQuery(query, User.class)
				.getResultList();
	}
	
	@Override
	public List<User> getAllUsers()
	{
		return entityManager.createQuery("from User",User.class).getResultList();
	}

	@Override
	public User getUserByEmail(String email) {
        String query = "from User where lower(email) = :email";

            List<User> users = entityManager.createQuery( query, User.class )
                .setParameter( "email", email.toLowerCase() )
                .getResultList();
            
//            System.out.println("ROLE IS: " + users.get( 0 ).getRoles().iterator().next());
            return users.size() == 0 ? null : users.get( 0 );
	}
}
