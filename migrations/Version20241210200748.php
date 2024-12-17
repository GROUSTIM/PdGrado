<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20241210200748 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE persona (id SERIAL NOT NULL, nombre VARCHAR(100) NOT NULL, apellido VARCHAR(100) NOT NULL, sexo VARCHAR(50) NOT NULL, edad INT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE roles (id SERIAL NOT NULL, user_roles_id INT NOT NULL, nombres VARCHAR(50) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_B63E2EC7D84AB5C4 ON roles (user_roles_id)');
        $this->addSql('CREATE TABLE user_roles (id SERIAL NOT NULL, roles_id INT NOT NULL, usuario_id INT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_54FCD59F38C751C4 ON user_roles (roles_id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_54FCD59FDB38439E ON user_roles (usuario_id)');
        $this->addSql('ALTER TABLE roles ADD CONSTRAINT FK_B63E2EC7D84AB5C4 FOREIGN KEY (user_roles_id) REFERENCES user_roles (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE user_roles ADD CONSTRAINT FK_54FCD59F38C751C4 FOREIGN KEY (roles_id) REFERENCES roles (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE user_roles ADD CONSTRAINT FK_54FCD59FDB38439E FOREIGN KEY (usuario_id) REFERENCES "user" (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE "user" ADD person_id INT NOT NULL');
        $this->addSql('ALTER TABLE "user" ADD CONSTRAINT FK_8D93D649217BBB47 FOREIGN KEY (person_id) REFERENCES persona (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_8D93D649217BBB47 ON "user" (person_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE "user" DROP CONSTRAINT FK_8D93D649217BBB47');
        $this->addSql('ALTER TABLE roles DROP CONSTRAINT FK_B63E2EC7D84AB5C4');
        $this->addSql('ALTER TABLE user_roles DROP CONSTRAINT FK_54FCD59F38C751C4');
        $this->addSql('ALTER TABLE user_roles DROP CONSTRAINT FK_54FCD59FDB38439E');
        $this->addSql('DROP TABLE persona');
        $this->addSql('DROP TABLE roles');
        $this->addSql('DROP TABLE user_roles');
        $this->addSql('DROP INDEX UNIQ_8D93D649217BBB47');
        $this->addSql('ALTER TABLE "user" DROP person_id');
    }
}
