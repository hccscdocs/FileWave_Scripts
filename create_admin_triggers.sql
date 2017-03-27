--
-- Name: trigger_add_delete_user; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_add_delete_user ON admin."user";
CREATE TRIGGER trigger_add_delete_user AFTER INSERT OR DELETE ON admin."user" FOR EACH ROW EXECUTE PROCEDURE admin.process_insert_delete_user();


--
-- Name: trigger_add_delete_user_identity; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_add_delete_user_identity ON admin.user_identity;
CREATE TRIGGER trigger_add_delete_user_identity AFTER INSERT OR DELETE ON admin.user_identity FOR EACH ROW EXECUTE PROCEDURE admin.process_insert_delete_user_identity();


--
-- Name: trigger_add_mod_delete_ldap_extract; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_add_mod_delete_ldap_extract ON admin.ldap_extract;
CREATE TRIGGER trigger_add_mod_delete_ldap_extract AFTER DELETE OR UPDATE ON admin.ldap_extract FOR EACH ROW EXECUTE PROCEDURE admin.process_change_ldap_extract();


--
-- Name: trigger_add_mod_delete_ldap_server; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_add_mod_delete_ldap_server ON admin.ldap_server;
CREATE TRIGGER trigger_add_mod_delete_ldap_server AFTER INSERT OR DELETE OR UPDATE ON admin.ldap_server FOR EACH ROW EXECUTE PROCEDURE admin.process_change_ldap_server();


--
-- Name: trigger_add_mod_delete_smart_filter; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_add_mod_delete_smart_filter ON admin.smart_filter;
CREATE TRIGGER trigger_add_mod_delete_smart_filter AFTER INSERT OR DELETE OR UPDATE ON admin.smart_filter FOR EACH ROW EXECUTE PROCEDURE admin.process_change_smart_filter();


--
-- Name: trigger_add_mod_delete_user_clone_group; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_add_mod_delete_user_clone_group ON admin.user_clone_group;
CREATE TRIGGER trigger_add_mod_delete_user_clone_group AFTER INSERT OR DELETE OR UPDATE ON admin.user_clone_group FOR EACH ROW EXECUTE PROCEDURE admin.process_change_user_clone_group();


--
-- Name: trigger_delete_file_in_fileset; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_delete_file_in_fileset ON admin.file;
CREATE TRIGGER trigger_delete_file_in_fileset AFTER DELETE ON admin.file FOR EACH ROW EXECUTE PROCEDURE admin.process_delete_file_in_fileset();


--
-- Name: trigger_mod_user; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_mod_user ON admin."user";
CREATE TRIGGER trigger_mod_user AFTER UPDATE OF name, ip_address ON admin."user" FOR EACH ROW WHEN (((old.name <> new.name) OR (old.ip_address <> new.ip_address))) EXECUTE PROCEDURE admin.process_update_user();


--
-- Name: trigger_mod_user_identity; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_mod_user_identity ON admin.user_identity;
CREATE TRIGGER trigger_mod_user_identity AFTER UPDATE OF short_name, domain_name, ucg_id ON admin.user_identity FOR EACH ROW WHEN ((((old.short_name <> new.short_name) OR (old.domain_name <> new.domain_name)) OR (old.ucg_id <> new.ucg_id))) EXECUTE PROCEDURE admin.process_update_user_identity();


--
-- Name: trigger_new_file_in_fileset; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_new_file_in_fileset ON admin.file;
CREATE TRIGGER trigger_new_file_in_fileset AFTER INSERT ON admin.file FOR EACH ROW EXECUTE PROCEDURE admin.process_new_file_in_fileset();


--
-- Name: trigger_new_fileset; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_new_fileset ON admin.fileset;
CREATE TRIGGER trigger_new_fileset AFTER INSERT ON admin.fileset FOR EACH ROW EXECUTE PROCEDURE admin.process_new_fileset();


--
-- Name: trigger_update_file_in_fileset; Type: TRIGGER; Schema: admin; Owner: django
--
DROP TRIGGER IF EXISTS trigger_update_file_in_fileset ON admin.file;
CREATE TRIGGER trigger_update_file_in_fileset AFTER UPDATE ON admin.file FOR EACH ROW EXECUTE PROCEDURE admin.process_update_file_in_fileset();
