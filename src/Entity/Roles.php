<?php

namespace App\Entity;

use App\Repository\RolesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: RolesRepository::class)]
class Roles
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $nombres = null;

    /**
     * @var Collection<int, UserRoles>
     */
    #[ORM\OneToMany(targetEntity: UserRoles::class, mappedBy: 'roles')]
    private Collection $Roles;

    public function __construct()
    {
        $this->Roles = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombres(): ?string
    {
        return $this->nombres;
    }

    public function setNombres(string $nombres): static
    {
        $this->nombres = $nombres;

        return $this;
    }

    /**
     * @return Collection<int, UserRoles>
     */
    public function getRoles(): Collection
    {
        return $this->Roles;
    }

    public function addRole(UserRoles $role): static
    {
        if (!$this->Roles->contains($role)) {
            $this->Roles->add($role);
            $role->setRoles($this);
        }

        return $this;
    }

    public function removeRole(UserRoles $role): static
    {
        if ($this->Roles->removeElement($role)) {
            // set the owning side to null (unless already changed)
            if ($role->getRoles() === $this) {
                $role->setRoles(null);
            }
        }

        return $this;
    }

}
