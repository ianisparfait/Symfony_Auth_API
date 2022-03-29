<?php

namespace App\Entity;

use App\Repository\ForceAttacksRepository;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\BooleanFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * @ORM\Entity(repositoryClass=ForceAttacksRepository::class)
 * @ApiResource(
 *  normalizationContext={"groups"={"force:read"}},
 *  denormalizationContext={"groups"={"force:write"}}
 * )
 * @ApiFilter(SearchFilter::class, properties={"email": "partial" })
 */
class ForceAttacks
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups("force:read")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"force:read", "force:write"})
     */
    private $email;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"force:read", "force:write"})
     */
    private $count;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Groups({"force:read", "force:write"})
     */
    private $blocked;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getCount(): ?int
    {
        return $this->count;
    }

    public function setCount(int $count): self
    {
        $this->count = $count;

        return $this;
    }

    public function getBlocked(): ?bool
    {
        return $this->blocked;
    }

    public function setBlocked(?bool $blocked): self
    {
        $this->blocked = $blocked;

        return $this;
    }
}
