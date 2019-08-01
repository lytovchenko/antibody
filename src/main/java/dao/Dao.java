package dao;

import java.util.List;

public interface Dao<E, PK> {

    E create(E obj) throws DaoException;

    E read(PK key) throws DaoException;

    void update(E obj1, E obj2) throws DaoException;

    void delete(E obj) throws DaoException;

    List<E> getAll() throws DaoException;


}
