<?php

namespace App\Repository;

use App\Entity\ForceAttacks;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ForceAttacks|null find($id, $lockMode = null, $lockVersion = null)
 * @method ForceAttacks|null findOneBy(array $criteria, array $orderBy = null)
 * @method ForceAttacks[]    findAll()
 * @method ForceAttacks[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ForceAttacksRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ForceAttacks::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(ForceAttacks $entity, bool $flush = true): void
    {
        $this->_em->persist($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(ForceAttacks $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    // /**
    //  * @return ForceAttacks[] Returns an array of ForceAttacks objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('f.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ForceAttacks
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
